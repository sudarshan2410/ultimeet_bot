#include <csignal>
#include <glib.h>
#include <getopt.h> // Include for getopt_long
#include <iostream>
#include <vector>
#include "Config.h"
#include "Zoom.h"
#include "raw_record/MeetingManager.h"
#include "events/MeetingServiceEvent.h"



MeetingManager meetingManager;



void startMeeting(const std::string& meetingId, const std::string& joinUrl) {

    std::cout << "Starting meeting with ID Sudarshan: " << meetingId << std::endl;

    

    // meetingEvent.getMeetingId(meetingId);
    // meetingEvent.m_meetingId = meetingId;
    

    MeetingServiceEvent meetingEvent(meetingId);

    Log::info("MeetingServiceEvent created for Meeting ID: " + meetingEvent.getMeetingId());

    // Integrate the event instance into the Zoom SDK
    // Zoom::getInstance().setMeetingServiceEvent(&meetingEvent);

    meetingManager.startMeeting(meetingId, joinUrl, "");  // If the audio file is not needed, pass an empty string
}

void stopMeeting(const std::string& meetingId) {
    
    meetingManager.stopMeeting(meetingId);
}

void onAudioRawDataReceived(const std::string& meetingId, AudioRawData* data, uint32_t node_id) {
    meetingManager.handleAudioRawData(meetingId, data, node_id);
}

void onExit() {
    auto* zoom = &Zoom::getInstance();
    zoom->leave();
    zoom->clean();

    std::cout << "Exiting..." << std::endl;
}

void onSignal(int signal) {
    onExit();
    _Exit(signal);
}

gboolean onTimeout(gpointer data) {
    return TRUE;
}

SDKError run(int argc, char** argv) {
    SDKError err{SDKERR_SUCCESS};
    auto* zoom = &Zoom::getInstance();

    signal(SIGINT, onSignal);
    signal(SIGTERM, onSignal);

    atexit(onExit);

    int option_index = 0;
    const char* short_options = "u:m:"; // Removed 'a' from options
    static struct option long_options[] = {
        {"url", required_argument, nullptr, 'u'},
        {"meeting", required_argument, nullptr, 'm'},
        {nullptr, 0, nullptr, 0}
    };

    std::vector<std::string> joinUrls;
    std::vector<std::string> meetingIds;

    while (true) {
        int c = getopt_long(argc, argv, short_options, long_options, &option_index);
        if (c == -1) break; // End of options

        switch (c) {
            case 'u':
                joinUrls.push_back(optarg);
                break;
            case 'm':
                meetingIds.push_back(optarg);
                break;
            default:
                std::cerr << "Usage: " << argv[0] << " -u <join_url> -m <meeting_id>" << std::endl;
                return SDKERR_INVALID_PARAMETER;
        }
    }

    if (joinUrls.size() != meetingIds.size()) {
        std::cerr << "The number of join_urls and meeting_ids must be the same" << std::endl;
        return SDKERR_INVALID_PARAMETER;
    }

    // Initialize configuration
    err = zoom->config(argc, argv);
    if (Zoom::hasError(err, "configure"))
        return err;

    // Initialize the Zoom SDK
    err = zoom->init();
    if (Zoom::hasError(err, "initialize"))
        return err;

    // Authorize with the Zoom SDK
    err = zoom->auth();
    if (Zoom::hasError(err, "authorize"))
        return err;

    // Start meetings
    for (size_t i = 0; i < joinUrls.size(); ++i) {
        startMeeting(meetingIds[i], joinUrls[i]);
    }

    return err;
}

int main(int argc, char** argv) {
    SDKError err = run(argc, argv);

    if (Zoom::hasError(err))
        return err;

    GMainLoop* eventLoop;
    eventLoop = g_main_loop_new(NULL, FALSE);
    g_timeout_add(100, onTimeout, eventLoop);
    g_main_loop_run(eventLoop);

    // Added Sudarshan For Meeting_id : Start
    Config config;
    config.read(argc, argv);
    std::string meetingId = config.meetingId();
    MeetingServiceEvent meetingEvent(meetingId);

    // MeetingServiceEvent meetingServiceEvent;
    // meetingServiceEvent.parseArguments(argc, argv);
    
    // Added Sudarshan For Meeting_id : End

    return err;
}
