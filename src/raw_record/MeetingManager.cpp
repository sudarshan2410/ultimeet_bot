#include "MeetingManager.h"
#include "../events/MeetingServiceEvent.h"
// #include "Config.h"


void MeetingManager::initializeAudioDelegate(bool useMixedAudio, ZOOMSDK::IMeetingService* meetingService) {
    // Ensure the meeting service instance is valid before creating the delegate
    if (meetingService != nullptr) {
        audioDelegate = std::make_shared<ZoomSDKAudioRawDataDelegate>(useMixedAudio, meetingService);
    } else {
        // Handle the case where the meeting service is null
        // This could be logging an error or throwing an exception
        // For simplicity, we just log an error message here
        std::cerr << "Error: Meeting service is null. Cannot initialize audio delegate." << std::endl;
    }
}

void MeetingManager::startMeeting(const std::string& meetingId, const std::string& joinUrl, const std::string& audioFile) {
    if (meetings.find(meetingId) == meetings.end()) {
        auto delegate = std::make_shared<ZoomSDKAudioRawDataDelegate>(/* appropriate parameters */);
        // Initialize and start meeting using delegate
        // Pass joinUrl and audioFile to the delegate's config or initialization methods
        Log::info("stopMeeting function called for Meeting ID: " + meetingId);

        MeetingServiceEvent meetingServiceEvent;
        
        meetingServiceEvent.parseArguments(meetingId);

        meetings[meetingId] = delegate;
    }
}

void MeetingManager::stopMeeting(const std::string& meetingId) {
    if (meetings.find(meetingId) != meetings.end()) {
        // Stop and clean up the meeting delegate
        
        meetings.erase(meetingId);
    }
}

void MeetingManager::handleAudioRawData(const std::string& meetingId, AudioRawData* data, uint32_t node_id) {
    if (meetings.find(meetingId) != meetings.end()) {
        meetings[meetingId]->onOneWayAudioRawDataReceived(data, node_id);
        // Or use onMixedAudioRawDataReceived if that's the appropriate method
    }
}
