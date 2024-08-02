#ifndef ZOOM_SDK_AUDIO_RAW_DATA_DELEGATE_H
#define ZOOM_SDK_AUDIO_RAW_DATA_DELEGATE_H

#include "zoom_sdk_raw_data_def.h"
#include "rawdata/rawdata_audio_helper_interface.h"
#include "meeting_service_components/meeting_participants_ctrl_interface.h"
#include "meeting_service_components/meeting_audio_interface.h"
#include "meeting_service_interface.h"
#include "../util/Log.h"

#include <chrono>
#include <string>
#include <unordered_map>

using namespace std;
using namespace ZOOMSDK;

class ZoomSDKAudioRawDataDelegate : public IZoomSDKAudioRawDataDelegate {
    string m_dir = "out";
    string m_filename = "test.pcm";
    bool m_useMixedAudio;
    IMeetingService* m_meetingService;

    void logSpeakerChange(uint32_t node_id, const string& newSpeaker);
    uint32_t m_currentNodeId;
    string m_currentSpeaker;
    chrono::steady_clock::time_point m_startTime;
    chrono::steady_clock::time_point m_endTime;
    bool m_recordingStarted = false;
    unordered_map<uint32_t, chrono::steady_clock::time_point> m_speakerStartTimes;

    void logSpeakerChangeToFile(const string& speaker, long long start_time, long long end_time);
    void writeToFile(const string& path, AudioRawData* data);

public:
    // Single constructor declaration
    ZoomSDKAudioRawDataDelegate(bool useMixedAudio, IMeetingService* meetingService);
    ZoomSDKAudioRawDataDelegate() : ZoomSDKAudioRawDataDelegate(false, nullptr) {}

    void setDir(const string& dir);
    void setFilename(const string& filename);

    void onMixedAudioRawDataReceived(AudioRawData* data, uint32_t node_id) override;
    void onOneWayAudioRawDataReceived(AudioRawData* data, uint32_t node_id) override;
    void onShareAudioRawDataReceived(AudioRawData* data) override;
    void onOneWayInterpreterAudioRawDataReceived(AudioRawData* data, const zchar_t* pLanguageName) override;

    ZOOMSDK::IUserInfo* getUserInfoByNodeId(uint32_t nodeId);
};

#endif // ZOOM_SDK_AUDIO_RAW_DATA_DELEGATE_H
