#ifndef MEETING_SDK_LINUX_SAMPLE_MEETINGSERVICEEVENT_H
#define MEETING_SDK_LINUX_SAMPLE_MEETINGSERVICEEVENT_H

#include <iostream>
#include <sstream>
#include <string>
#include <functional>
#include "meeting_service_interface.h"


#include "../util/Log.h"

#include <CLI/CLI.hpp>
#include "ConfigManager.h" 

using namespace std;
using namespace ZOOMSDK;

class MeetingServiceEvent : public IMeetingServiceEvent {
    function<void()> m_onMeetingJoin;
    function<void()> m_onMeetingEnd;
    function<void(MeetingStatus status, int iResult)> m_onMeetingStatusChanged;
    

    std::string m_meetingId;

    CLI::App m_app;

    

public:
    
    // Added Sudarshan For Meeting_ID

    static void uploadAudioFile(const std::string& meetingId, const std::string& audioFilePath);
    
    MeetingServiceEvent(const std::string& meetingId) : m_meetingId(meetingId) {
        Log::info("MeetingServiceEvent initialized with Meeting ID: " + m_meetingId);
    };

    const std::string& getMeetingId() const { 
        Log::success("meeting ended for in getMeetingId: " + m_meetingId);
        return m_meetingId; 
    }

    MeetingServiceEvent() : m_app("Zoom Meeting SDK") {
        // Define an option for the meeting ID and bind it to the local variable
        m_app.add_option("-m,--meeting-id", m_meetingId, "Meeting ID of the meeting")
            ->required()
            ->check(
                CLI::Validator(
                    [](const std::string &meetingId) -> std::string {
                        if (meetingId.empty()) {
                            return "Meeting ID cannot be empty";
                        }
                        return {}; // Return an empty string on success
                    }, "Meeting ID validator"
                )
            );
    }

    // Method to parse command-line arguments
    void parseArguments(const std::string& meetingId) {
    try {
        Log::success("parseArguments: " + meetingId);
        // Set the meeting ID in the ConfigManager after parsing
        ConfigManager::getInstance().setMeetingId(meetingId);
        m_meetingId = ConfigManager::getInstance().getMeetingId();
        Log::success("meetingId: " + meetingId);
    } catch (const CLI::ParseError &e) {
        std::exit(m_app.exit(e)); // Handle the exception by exiting
    }
}




    /**
     * Meeting status changed callback
     * @param status value of the current meeting status
     * @param iResult detailed reasons for special meeting statuses
     */
    void onMeetingStatusChanged(MeetingStatus status, int iResult) override;

    /**
     * callback will be triggered right before the meeting starts
     * The meeting_param will be destroyed once the function calls end
     * @param meeting_param holds parameters for a newly created meeting
     */
    void onMeetingParameterNotification(const MeetingParameter* meeting_param) override {};

    /**
     * callback used when there are Meeting statistics warning notifications
     * @param type type of statistics warning
     */
    void onMeetingStatisticsWarningNotification(StatisticsWarningType type) override {};

    /**
     * Callback event when a meeting is suspended
     */
    void onSuspendParticipantsActivities() override {};

    /**
     * Callback event used when the AI Companion active status changed.
     * @param bActive true if the AI Companion is active
     */
    void onAICompanionActiveChangeNotice(bool bActive) override {};


    /* Setters for Callbacks */
    void setOnMeetingJoin(const function<void()>& callback);
    void setOnMeetingEnd(const function<void()>& callback);
    void setOnMeetingStatusChanged(const function<void(MeetingStatus, int)>& callback);
};

#endif //MEETING_SDK_LINUX_SAMPLE_MEETINGSERVICEEVENT_H
