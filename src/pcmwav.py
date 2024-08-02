import wave
import os

def pcm_to_wav(pcm_file, wav_file, channels=1, sample_rate=32000, bits_per_sample=16):
    """
    Converts a PCM file to a WAV file.

    :param pcm_file: Path to the input PCM file.
    :param wav_file: Path to the output WAV file.
    :param channels: Number of audio channels (default is 1).
    :param sample_rate: Sample rate in Hz (default is 32000).
    :param bits_per_sample: Number of bits per sample (default is 16).
    """
    # Determine the sample width based on bits per sample
    if bits_per_sample == 8:
        sampwidth = 1
    elif bits_per_sample == 16:
        sampwidth = 2
    elif bits_per_sample == 32:
        sampwidth = 4
    else:
        raise ValueError("Unsupported bits per sample: {}".format(bits_per_sample))

    # Check if PCM file exists
    if not os.path.isfile(pcm_file):
        raise FileNotFoundError(f"PCM file not found: {pcm_file}")

    # Read PCM data
    with open(pcm_file, 'rb') as pcm_f:
        pcm_data = pcm_f.read()

    # Check if PCM data was read
    if not pcm_data:
        raise ValueError(f"No data read from PCM file: {pcm_file}")

    # Write WAV data
    with wave.open(wav_file, 'wb') as wav_f:
        wav_f.setnchannels(channels)
        wav_f.setsampwidth(sampwidth)
        wav_f.setframerate(sample_rate)
        wav_f.writeframes(pcm_data)

    print(f"Conversion complete: {wav_file}")

if __name__ == "__main__":
    pcm_file = "/Users/sudarshanchavan/Desktop/speaker_labels/speaker_label_zoom 4/out/9992.pcm"
    wav_file = "/Users/sudarshanchavan/Desktop/speaker_labels/speaker_label_zoom 4/out/9992.wav"
    channels = 1         # Mono
    sample_rate = 32000  # 32kHz, typical for Zoom recordings
    bits_per_sample = 16 # 16 bits per sample

    pcm_to_wav(pcm_file, wav_file, channels, sample_rate, bits_per_sample)
