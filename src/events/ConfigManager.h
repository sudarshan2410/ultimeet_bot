#ifndef CONFIG_MANAGER_H
#define CONFIG_MANAGER_H

#include <string>
#include <mutex>
#include "../util/Log.h"

class ConfigManager {
public:
    static ConfigManager& getInstance() {
        static ConfigManager instance; // Guaranteed to be destroyed and instantiated on first use.
        return instance;
    }

    // Delete copy constructor and assignment operator
    ConfigManager(ConfigManager const&) = delete;
    void operator=(ConfigManager const&) = delete;

    // Methods to get and set the meeting ID
    void setMeetingId(const std::string& meetingId) {
        std::lock_guard<std::mutex> lock(m_mutex);
        m_meetingId = meetingId;
        Log::success("ConfigManager : " + m_meetingId);
    }

    std::string getMeetingId() const {
        std::lock_guard<std::mutex> lock(m_mutex);
        return m_meetingId;
    }

private:
    ConfigManager() {} // Private constructor
    mutable std::mutex m_mutex;
    std::string m_meetingId;
};

#endif // CONFIG_MANAGER_H
