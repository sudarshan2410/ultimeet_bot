#include <iostream>
#include <fstream>
#include <cstdint>

// WAV Header structure
#pragma pack(push, 1)
struct WAVHeader {
    // RIFF Header
    char riff[4] = {'R', 'I', 'F', 'F'};
    uint32_t chunkSize;
    char wave[4] = {'W', 'A', 'V', 'E'};
    // Format Header
    char fmt[4] = {'f', 'm', 't', ' '};
    uint32_t subchunk1Size = 16;  // for PCM
    uint16_t audioFormat = 1;     // PCM
    uint16_t numChannels;
    uint32_t sampleRate;
    uint32_t byteRate;
    uint16_t blockAlign;
    uint16_t bitsPerSample;
    // Data Header
    char data[4] = {'d', 'a', 't', 'a'};
    uint32_t dataSize;
};
#pragma pack(pop)

// Function to convert PCM to WAV
void convertPCMToWAV(const std::string& pcmFile, const std::string& wavFile, 
                     uint16_t channels, uint32_t sampleRate, uint16_t bitsPerSample) {
    std::ifstream pcm(pcmFile, std::ios::binary);
    if (!pcm.is_open()) {
        std::cerr << "Failed to open PCM file: " << pcmFile << std::endl;
        return;
    }

    std::ofstream wav(wavFile, std::ios::binary);
    if (!wav.is_open()) {
        std::cerr << "Failed to open WAV file: " << wavFile << std::endl;
        pcm.close();
        return;
    }

    pcm.seekg(0, std::ios::end);
    uint32_t pcmDataSize = pcm.tellg();
    pcm.seekg(0, std::ios::beg);

    WAVHeader header;
    header.numChannels = channels;
    header.sampleRate = sampleRate;
    header.bitsPerSample = bitsPerSample;
    header.byteRate = sampleRate * channels * bitsPerSample / 8;
    header.blockAlign = channels * bitsPerSample / 8;
    header.dataSize = pcmDataSize;
    header.chunkSize = 36 + header.dataSize;

    wav.write(reinterpret_cast<const char*>(&header), sizeof(header));
    wav << pcm.rdbuf();

    pcm.close();
    wav.close();
}

int main() {
    std::string pcmFile = "out/meeting-audio.pcm";
    std::string wavFile = "out/output.wav";
    uint16_t channels = 2;      // Stereo
    uint32_t sampleRate = 44100; // 44.1kHz
    uint16_t bitsPerSample = 16; // 16 bits per sample

    convertPCMToWAV(pcmFile, wavFile, channels, sampleRate, bitsPerSample);

    std::cout << "Conversion complete: " << wavFile << std::endl;
    return 0;
}
