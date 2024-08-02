import wave
import os
import sys

def pcm_to_wav(pcm_file, wav_file, channels=1, sample_rate=32000, bits_per_sample=16):
    sampwidth = bits_per_sample // 8
    if not os.path.isfile(pcm_file):
        raise FileNotFoundError(f"PCM file not found: {pcm_file}")

    with open(pcm_file, 'rb') as pcm_f:
        pcm_data = pcm_f.read()

    if not pcm_data:
        raise ValueError(f"No data read from PCM file: {pcm_file}")

    with wave.open(wav_file, 'wb') as wav_f:
        wav_f.setnchannels(channels)
        wav_f.setsampwidth(sampwidth)
        wav_f.setframerate(sample_rate)
        wav_f.writeframes(pcm_data)

    print(f"Conversion complete: {wav_file}")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 pcm_to_wav.py <pcm_file> <wav_file>")
        sys.exit(1)

    pcm_file = sys.argv[1]
    wav_file = sys.argv[2]
    pcm_to_wav(pcm_file, wav_file)
