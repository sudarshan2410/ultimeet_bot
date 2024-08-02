#include "ZoomSDKAudioRawDataDelegate.h"
#include "meeting_service_components/meeting_participants_ctrl_interface.h"
#include "meeting_service_interface.h" 
// #include "meeting_service_components/meeting_participants_ctrl_interface.h"

#include <iostream>
#include <sstream>
#include <fstream>

// Added By Sudarshan For Timestamp
#include <iomanip>



ZoomSDKAudioRawDataDelegate::ZoomSDKAudioRawDataDelegate(bool useMixedAudio, IMeetingService* meetingService)
    : m_useMixedAudio(useMixedAudio), m_meetingService(meetingService) {}


// Sudarshan Changed Ligoc
// void ZoomSDKAudioRawDataDelegate::onOneWayAudioRawDataReceived(AudioRawData* data, uint32_t node_id) {
//     if (m_useMixedAudio) return;

//     stringstream path;
//     path << m_dir << "/node-" << node_id << ".pcm";
//     writeToFile(path.str(), data);
    
//     std::cout << "[DEBUG] onOneWayAudioRawDataReceived called" << std::endl;
//     std::cout << "[DEBUG] Node ID: " << node_id << std::endl;

//     IUserInfo* userInfo = getUserInfoByNodeId(node_id);
//     if (userInfo) {
//         std::cout << "User Info:" << std::endl;
//         // std::cout << "  UserID: " << userInfo->GetUserID() << std::endl;
//         // std::cout << "  UserName: " << userInfo->GetUserName() << std::endl;
//         // std::cout << "  IsHost: " << userInfo->IsHost() << std::endl;
//         // std::cout << "  IsVideoOn: " << userInfo->IsVideoOn() << std::endl;
//         // std::cout << "  IsAudioMuted: " << userInfo->IsAudioMuted() << std::endl;
//         // std::cout << "  IsMySelf: " << userInfo->IsMySelf() << std::endl;
//         // std::cout << "  IsInWaitingRoom: " << userInfo->IsInWaitingRoom() << std::endl;
//         // std::cout << "  IsRaiseHand: " << userInfo->IsRaiseHand() << std::endl;
//         // std::cout << "  GetUserRole: " << userInfo->GetUserRole() << std::endl;
//         // std::cout << "  IsPurePhoneUser: " << userInfo->IsPurePhoneUser() << std::endl;
//         // std::cout << "  GetAudioVoiceLevel: " << userInfo->GetAudioVoiceLevel() << std::endl;
//         // std::cout << "  IsClosedCaptionSender: " << userInfo->IsClosedCaptionSender() << std::endl;
//         // std::cout << "  IsTalking: " << userInfo->IsTalking() << std::endl;
//         // std::cout << "  IsH323User: " << userInfo->IsH323User() << std::endl;
//         // #if defined(WIN32)
//         // std::cout << "  IsInterpreter: " << userInfo->IsInterpreter() << std::endl;
//         // std::cout << "  IsSignLanguageInterpreter: " << userInfo->IsSignLanguageInterpreter() << std::endl;
//         // std::cout << "  GetInterpreterActiveLanguage: " << userInfo->GetInterpreterActiveLanguage() << std::endl;
//         // std::cout << "  GetEmojiFeedbackType: " << userInfo->GetEmojiFeedbackType() << std::endl;
//         // #endif
//         // std::cout << "  GetLocalRecordingStatus: " << userInfo->GetLocalRecordingStatus() << std::endl;
//         // std::cout << "  IsRawLiveStreaming: " << userInfo->IsRawLiveStreaming() << std::endl;
//         // std::cout << "  HasRawLiveStreamPrivilege: " << userInfo->HasRawLiveStreamPrivilege() << std::endl;
//         // std::cout << "  HasCamera: " << userInfo->HasCamera() << std::endl;

//         std::string userName = userInfo->GetUserName();

//         if (userInfo->IsH323User()) {
//             if (!m_recordingStarted) {
//                 m_startTime = chrono::steady_clock::now();
//                 m_speakerStartTimes[node_id] = m_startTime;
//                 auto start = chrono::duration_cast<chrono::seconds>(m_startTime.time_since_epoch()).count();
//                 std::cout << "Recording started, Initial Start_Time: " << start << " s" << std::endl;
//                 m_currentSpeaker = userName;
//                 m_recordingStarted = true;
//                 m_currentNodeId = node_id;
//             } else if (node_id != m_currentNodeId) {
//                 logSpeakerChange(node_id, userName);
//                 m_currentNodeId = node_id;
//                 m_currentSpeaker = userName;
//                 m_startTime = chrono::steady_clock::now();
//                 m_speakerStartTimes[node_id] = m_startTime;
//             }
//         } else {
//             if (m_currentNodeId == node_id) {
//                 auto end_time = chrono::steady_clock::now();
//                 auto start = chrono::duration_cast<chrono::seconds>(m_speakerStartTimes[m_currentNodeId].time_since_epoch()).count();
//                 auto end = chrono::duration_cast<chrono::seconds>(end_time.time_since_epoch()).count();
//                 std::cout << "UserName: " << m_currentSpeaker << ", Start_Time: " << start << " s, End_Time: " << end << " s" << std::endl;
//                 logSpeakerChangeToFile(m_currentSpeaker, start, end);
//                 m_currentNodeId = 0;
//                 m_currentSpeaker = "";
//                 m_recordingStarted = false;
//             }
//         }
//     } else {
//         std::cout << "User Info not found for Node ID: " << node_id << std::endl;
//     }

//     // stringstream path;
//     // // path << m_dir << "/node-" << node_id << ".pcm";
//     // path << m_dir << "/" << m_filename;
//     // std::cout << "[DEBUG] Writing to file: " << path.str() << std::endl;

//     // writeToFile(path.str(), data);
// }

void ZoomSDKAudioRawDataDelegate::onOneWayAudioRawDataReceived(AudioRawData* data, uint32_t node_id) {
    // if (m_useMixedAudio) return;

    std::stringstream path;
    path << m_dir << "/node-" << node_id << ".pcm";
    writeToFile(path.str(), data);

    std::cout << "[DEBUG] onOneWayAudioRawDataReceived called" << std::endl;
    std::cout << "[DEBUG] Node ID: " << node_id << std::endl;

    IUserInfo* userInfo = getUserInfoByNodeId(node_id);
    if (userInfo) {
        std::cout << "User Info:" << std::endl;

        std::string userName = userInfo->GetUserName();
        bool isH323User = userInfo->IsH323User();

        if (isH323User) {
            if (!m_recordingStarted) {
                m_startTime = chrono::steady_clock::now();
                m_speakerStartTimes[node_id] = m_startTime;
                auto start = chrono::duration_cast<chrono::seconds>(m_startTime.time_since_epoch()).count();
                std::cout << "Recording started, Initial Start_Time: " << start << " s" << std::endl;
                m_currentSpeaker = userName;
                m_recordingStarted = true;
                m_currentNodeId = node_id;
            } else if (node_id != m_currentNodeId) {
                logSpeakerChange(node_id, userName);
                m_currentNodeId = node_id;
                m_currentSpeaker = userName;
                m_startTime = chrono::steady_clock::now();
                m_speakerStartTimes[node_id] = m_startTime;
            }
        } else {
            if (m_currentNodeId == node_id) {
                auto end_time = chrono::steady_clock::now();
                auto start = chrono::duration_cast<chrono::seconds>(m_speakerStartTimes[m_currentNodeId].time_since_epoch()).count();
                auto end = chrono::duration_cast<chrono::seconds>(end_time.time_since_epoch()).count();
                std::cout << "UserName: " << m_currentSpeaker << ", Start_Time: " << start << " s, End_Time: " << end << " s" << std::endl;
                logSpeakerChangeToFile(m_currentSpeaker, start, end);
                m_currentNodeId = 0;
                m_currentSpeaker = "";
                m_recordingStarted = false;
            }
        }
    } else {
        std::cout << "User Info not found for Node ID: " << node_id << std::endl;
    }

    
}

void ZoomSDKAudioRawDataDelegate::logSpeakerChange(uint32_t node_id, const std::string& newSpeaker) {
    if (!m_currentSpeaker.empty() && m_speakerStartTimes.find(m_currentNodeId) != m_speakerStartTimes.end()) {
        auto end_time = chrono::steady_clock::now();
        auto start = chrono::duration_cast<chrono::seconds>(m_speakerStartTimes[m_currentNodeId].time_since_epoch()).count();
        auto end = chrono::duration_cast<chrono::seconds>(end_time.time_since_epoch()).count();

        std::cout << "UserName: " << m_currentSpeaker << ", Start_Time: " << start << " s, End_Time: " << end << " s" << std::endl;
        std::cout << "UserName: " << newSpeaker << ", Start_Time: " << end << " s" << std::endl;
        logSpeakerChangeToFile(m_currentSpeaker, start, end);
        logSpeakerChangeToFile(newSpeaker, end, -1);  // Log the new speaker with no end time yet
    }
}

void ZoomSDKAudioRawDataDelegate::logSpeakerChangeToFile(const std::string& speaker, long long start_time, long long end_time) {
    std::ofstream file("speaker_log.txt", std::ios::app);
    if (file.is_open()) {
        file << "UserName: " << speaker << ", Start_Time: " << start_time << " s";
        if (end_time >= 0) {
            file << ", End_Time: " << end_time << " s";
        }
        file << std::endl;
        file.close();
    } else {
        std::cout << "[ERROR] Failed to open log file." << std::endl;
    }
}


ZOOMSDK::IUserInfo* ZoomSDKAudioRawDataDelegate::getUserInfoByNodeId(uint32_t nodeId) {
    IMeetingParticipantsController* participantsController = m_meetingService->GetMeetingParticipantsController();
    return participantsController ? participantsController->GetUserByUserID(nodeId) : nullptr;
}

// Added Sudarshan To change Speaker Change
// Added Sudarshan Timestamp After Change
// void ZoomSDKAudioRawDataDelegate::logSpeakerChange(const string& newSpeaker) {
    // Original Main Functions
// void ZoomSDKAudioRawDataDelegate::logSpeakerChange(uint32_t node_id, const string& newSpeaker) {
//     if (!m_currentSpeaker.empty() && m_speakerStartTimes.find(m_currentNodeId) != m_speakerStartTimes.end()) {
//         auto end_time = chrono::steady_clock::now();
//         auto start = chrono::duration_cast<chrono::seconds>(m_speakerStartTimes[m_currentNodeId].time_since_epoch()).count();
//         auto end = chrono::duration_cast<chrono::seconds>(end_time.time_since_epoch()).count();

//         std::cout << "UserName: " << m_currentSpeaker << ", Start_Time: " << start << " s, End_Time: " << end << " s" << std::endl;
//         std::cout << "UserName: " << newSpeaker << ", Start_Time: " << end << " s" << std::endl;
//         logSpeakerChangeToFile(m_currentSpeaker, start, end);
//         logSpeakerChangeToFile(newSpeaker, end, -1);  // Log the new speaker with no end time yet
//     }
// }

// void ZoomSDKAudioRawDataDelegate::logSpeakerChangeToFile(const string& speaker, long long start_time, long long end_time) {
//     std::ofstream file("speaker_log.txt", std::ios::app);
//     if (file.is_open()) {
//         file << "UserName: " << speaker << ", Start_Time: " << start_time << " s";
//         if (end_time >= 0) {
//             file << ", End_Time: " << end_time << " s";
//         }
//         file << std::endl;
//         file.close();
//     } else {
//         std::cout << "[ERROR] Failed to open log file." << std::endl;
//     }
// }




// void ZoomSDKAudioRawDataDelegate::onOneWayAudioRawDataReceived(AudioRawData* data, uint32_t node_id) {
//     if (m_useMixedAudio) return;

//     // Print node_id for confirmation
//     std::cout << "Node ID: " << node_id << std::endl;

//     std::stringstream path;
//     path << m_dir << "/node-" << node_id << ".pcm";
//     writeToFile(path.str(), data);
// }

// void ZoomSDKAudioRawDataDelegate::onOneWayAudioRawDataReceived(AudioRawData* data, uint32_t node_id) {
//     // Add debug statement to ensure function is being called
//     std::cout << "[DEBUG] onOneWayAudioRawDataReceived called" << std::endl;

//     if (m_useMixedAudio) {
//         std::cout << "[DEBUG] m_useMixedAudio is true, returning" << std::endl;
//         std::cout << "[DEBUG] Node ID: " << node_id << std::endl;
//         return;
//     }

//     // Print node_id for confirmation
//     std::cout << "[DEBUG] Node ID: " << node_id << std::endl;

//     std::stringstream path;
//     path << m_dir << "/node-" << node_id << ".pcm";
//     std::cout << "[DEBUG] Writing to file: " << path.str() << std::endl;
    
//     writeToFile(path.str(), data);
// }



void ZoomSDKAudioRawDataDelegate::onShareAudioRawDataReceived(AudioRawData* data) {
    stringstream ss;
    ss << "Shared Audio Raw data: " << data->GetBufferLen() << "b at " << data->GetSampleRate() << "Hz";
    Log::info(ss.str());
}


// void ZoomSDKAudioRawDataDelegate::writeToFile(const string &path, AudioRawData *data)
// {
//     static std::ofstream file;
//     if (!file.is_open()) {
//         file.open(path, std::ios::binary | std::ios::out);
//     }

//     if (file.is_open()) {
//         file.write((const char*)data->GetBuffer(), data->GetBufferLen());
//     } else {
//         std::cout << "[ERROR] Failed to open file: " << path << std::endl;
//     }
// }

void ZoomSDKAudioRawDataDelegate::writeToFile(const string &path, AudioRawData *data)
{
    static std::ofstream file;
	file.open(path, std::ios::out | std::ios::binary | std::ios::app);

	if (!file.is_open())
        return Log::error("failed to open audio file path: " + path);
	
    file.write(data->GetBuffer(), data->GetBufferLen());

    file.close();
	file.flush();

    stringstream ss;
    ss << "Writing " << data->GetBufferLen() << "b to " << path << " at " << data->GetSampleRate() << "Hz";

    Log::info(ss.str());
}


void ZoomSDKAudioRawDataDelegate::onMixedAudioRawDataReceived(AudioRawData *data,uint32_t node_id) {
    if (!m_useMixedAudio) return;

    if (m_dir.empty())
        return Log::error("Output Directory cannot be blank");

    if (m_filename.empty())
        m_filename = "test.pcm";

    stringstream path;
    path << m_dir << "/" << m_filename;

    std::cout << "[DEBUG] onOneWayAudioRawDataReceived called" << std::endl;
    std::cout << "[DEBUG] Node ID: " << node_id << std::endl;

    writeToFile(path.str(), data);
}

void ZoomSDKAudioRawDataDelegate::setDir(const string &dir)
{
    m_dir = dir;
}

void ZoomSDKAudioRawDataDelegate::setFilename(const string &filename)
{
    m_filename = filename;
}

void ZoomSDKAudioRawDataDelegate::onOneWayInterpreterAudioRawDataReceived(AudioRawData* data, const zchar_t* pLanguageName) {
    // Implementation here
}
