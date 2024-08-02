#ifndef MEETING_MANAGER_H
#define MEETING_MANAGER_H

#include <unordered_map>
#include <memory>
#include "ZoomSDKAudioRawDataDelegate.h"

class MeetingManager {
public:
    void initializeAudioDelegate(bool useMixedAudio, ZOOMSDK::IMeetingService* meetingService);
    void startMeeting(const std::string& meetingId, const std::string& joinUrl, const std::string& audioFile);
    void stopMeeting(const std::string& meetingId);
    void handleAudioRawData(const std::string& meetingId, AudioRawData* data, uint32_t node_id);

private:
    std::shared_ptr<ZoomSDKAudioRawDataDelegate> audioDelegate;
    std::unordered_map<std::string, std::shared_ptr<ZoomSDKAudioRawDataDelegate>> meetings;
    // std::unordered_map<std::string, std::shared_ptr<ZoomSDKAudioRawDataDelegate>> meetings;
};

#endif // MEETING_MANAGER_H
