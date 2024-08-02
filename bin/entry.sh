#!/usr/bin/env bash

LOG_DIR="/var/log/zoom"
LOG_FILE="$LOG_DIR/entry.log"
BUILD=build
CONFIG_FILE="config.toml"

mkdir -p $LOG_DIR
mkdir -p out

setup-pulseaudio() {
    echo "Setting up PulseAudio..." | tee -a $LOG_FILE
    if [[ ! -d /var/run/dbus ]]; then
        mkdir -p /var/run/dbus
        dbus-uuidgen > /var/lib/dbus/machine-id
        dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address
    fi
    usermod -G pulse-access,audio root
    rm -rf /var/run/pulse /var/lib/pulse /root/.config/pulse/
    mkdir -p ~/.config/pulse/ && cp -r /etc/pulse/* ~/.config/pulse/
    pulseaudio -D --exit-idle-time=-1 --system --disallow-exit
    pactl load-module module-null-sink sink_name=SpeakerOutput
    pactl set-default-sink SpeakerOutput
    pactl set-default-source SpeakerOutput.monitor
    echo -e "[General]\nsystem.audio.type=default" > ~/.config/zoomus.conf
    echo "PulseAudio setup complete." | tee -a $LOG_FILE
}

build() {
    echo "Building project..." | tee -a $LOG_FILE
    [[ ! -d "$BUILD" ]] && { cmake -B "$BUILD" -S . --preset debug || exit 1; }
    LIB="lib/zoomsdk/libmeetingsdk.so"
    [[ ! -f "${LIB}.1" ]] && cp "$LIB"{,.1}
    setup-pulseaudio &> /dev/null || exit 1
    cmake --build "$BUILD" || exit 1
}

update_config() {
    local join_url="$1"
    local audio_file="$2"
    local meeting_id="$3"

    # Update config.toml with the provided join_url and audio_file
    echo "Updating config.toml with URL: $join_url, Audio File: $audio_file, Meeting ID: $meeting_id" | tee -a $LOG_FILE
    cat > $CONFIG_FILE <<EOL
#### !! Do not store plain text credentials in production environments !!
#### File Format: https://cliutils.github.io/CLI11/book/chapters/config.html#configure-file-format

# Zoom Meeting SDK Client ID
client-id="BphVYPtdTdymLECJb3ugQ"

# Zoom Meeting SDK Client Secret
client-secret="PjdzphMFnNfu3ttmStJQxJVLnr95bfia"

[RawAudio]
file="$audio_file"
dir="./out"
separate-participants=false

[RawVideo]
file="meeting-video.yuv"
dir="./out"

[[meetings]]
join-url="$join_url"
audio-file="$audio_file"
meeting-id="$meeting_id"
EOL
}

run_meeting() {
    local join_url="$1"
    local meeting_id="$2"
    local audio_file="$3"

    update_config "$join_url" "$audio_file" "$meeting_id"

    echo "Starting meeting $meeting_id with URL $join_url and recording to $audio_file" | tee -a $LOG_FILE
    ./"$BUILD"/zoomsdk -u "$join_url" -m "$meeting_id" &>> "$LOG_FILE" &
}

build

while getopts "u:m:f:" opt; do
    case ${opt} in
        u ) join_url="$OPTARG" ;;
        m ) meeting_id="$OPTARG" ;;
        f ) audio_file="$OPTARG" ;;
        \? ) echo "Usage: $0 [-u join_url] [-m meeting_id] [-f audio_file]" | tee -a $LOG_FILE; exit 1 ;;
    esac
done

# Check if necessary parameters are provided
if [[ -z "$join_url" || -z "$meeting_id" || -z "$audio_file" ]]; then
    echo "Missing parameters! Usage: $0 -u <join_url> -m <meeting_id> -f <audio_file>" | tee -a $LOG_FILE
    exit 1
fi

run_meeting "$join_url" "$meeting_id" "$audio_file"

wait
