#include "MeetingServiceEvent.h"
#include "../Config.h"
#include "ConfigManager.h"

#include <curl/curl.h> // Include libcurl header
#include <iostream>



using namespace std;




// Function to upload audio file to the API
void uploadAudioFile(const std::string& meetingId, const std::string& audioFilePath) {
    Log::success("uploadAudioFile In upload File");
    CURL* curl;
    CURLcode res;

    // Construct the API URL using the meeting ID
    std::string apiUrl = "https://ultimeet-offline.ultimeet.io/api/v1/send/meeting/media/" + meetingId;

    // Initialize libcurl
    curl_global_init(CURL_GLOBAL_DEFAULT);
    curl = curl_easy_init();

    if (curl) {
        // Set the URL for the request
        curl_easy_setopt(curl, CURLOPT_URL, apiUrl.c_str());

        // Set the request method to PATCH
        curl_easy_setopt(curl, CURLOPT_CUSTOMREQUEST, "PATCH");

        // Initialize form data
        curl_mime* form = curl_mime_init(curl);
        curl_mimepart* field = curl_mime_addpart(form);

        // Set the audio file field
        curl_mime_name(field, "audio");
        curl_mime_filedata(field, audioFilePath.c_str());

        // Attach the form to the request
        curl_easy_setopt(curl, CURLOPT_MIMEPOST, form);

        // Perform the request
        res = curl_easy_perform(curl);

        // Check for errors
        if (res != CURLE_OK) {
            std::cerr << "curl_easy_perform() failed: " << curl_easy_strerror(res) << std::endl;
        } else {
            std::cout << "Successfully uploaded audio file to API." << std::endl;
        }

        // Clean up
        curl_mime_free(form);
        curl_easy_cleanup(curl);
    } else {
        std::cerr << "Failed to initialize CURL." << std::endl;
    }

    // Global libcurl cleanup
    curl_global_cleanup();
}


// Function to convert PCM to WAV using a Python script
void convertPcmToWav(const std::string& pcmFile, const std::string& wavFile,const std::string& meetingId) {
    std::string command = "python3 pcm_to_wav.py " + pcmFile + " " + wavFile;
    int result = std::system(command.c_str());
    if (result == 0) {
        std::cout << "PCM to WAV conversion successful: " << wavFile << std::endl;
        uploadAudioFile(meetingId, wavFile);
    } else {
        std::cerr << "PCM to WAV conversion failed." << std::endl;
    }
}

void MeetingServiceEvent::onMeetingStatusChanged(MeetingStatus status, int iResult) {
    if (m_onMeetingStatusChanged) {
        m_onMeetingStatusChanged(status, iResult);
        return;
    }

    stringstream ss;
    ss << iResult;
    auto result = ss.str();

    // Sudarshan Added For Meeting_id
    // std::string m_meetingId;
    // Config config;
    // config.read(argc, argv);
    // std::string meetingId = config.meetingId();
    Log::info("config.meetingId():::"+ getMeetingId());

    std::string meetingIdStr = m_meetingId;

    std::string meetingId = ConfigManager::getInstance().getMeetingId();
    std::string audioFilePath = "./out/" + meetingId + ".pcm";
    std::string wavFilePath = "./out/" + meetingId + ".wav";


    

    switch (status) {
        case MEETING_STATUS_CONNECTING:
            Log::info("connecting to the meeting");
            break;
        case MEETING_STATUS_RECONNECTING:
            Log::info("reconnecting to the meeting");
            break;
        case MEETING_STATUS_DISCONNECTING:
            Log::info("disconnecting from the meeting");
            break;
        case MEETING_STATUS_INMEETING:
            Log::success("connected");
            if (m_onMeetingJoin) m_onMeetingJoin();
            return;
        case MEETING_STATUS_ENDED:
            Log::success("meeting ended");
            
            // std::string meetingId = ConfigManager::getInstance().getMeetingId();
            Log::success("Meeting ended for Meeting ID: " + meetingId);
            // Send meeting status to API
            // sendMeetingStatus(meetingId, audioFilePath);
            
            convertPcmToWav(audioFilePath, wavFilePath,meetingId);
            

            
            
            if (m_onMeetingEnd) m_onMeetingEnd();
            return;
        // case MEETING_STATUS_ENDED:
        //     std::string meetingIdStr = m_meetingId;
        //     Log::success("meeting ended for Meeting ID: " + meetingIdStr);
        //     if (m_onMeetingEnd) m_onMeetingEnd();
        //     return;

        case MEETING_STATUS_FAILED:
            Log::error("failed to connect to the meeting with MeetingFailCode " + result);
            break;
        case MEETING_STATUS_WAITINGFORHOST:
            Log::info("waiting for the meeting to start");
            break;
        default:
            Log::error("unknown meeting status");
            break;
    }
}



void MeetingServiceEvent::setOnMeetingJoin(const function<void()>& callback) {
    m_onMeetingJoin = callback;
}

void MeetingServiceEvent::setOnMeetingEnd(const function<void()>& callback) {
    Log::error("Sudarshan Changed Event...");
    m_onMeetingEnd = callback;
}

void MeetingServiceEvent::setOnMeetingStatusChanged(const function<void(MeetingStatus, int)>& callback) {
    m_onMeetingStatusChanged = callback;
}
