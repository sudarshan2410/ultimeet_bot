FROM --platform=linux/amd64 ubuntu:22.04 AS base

ENV project=speakerlabel
ENV cwd=/tmp/$project

#  Install Dependencies
RUN apt-get update  \
    && apt-get install -y \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    gdb \
    git \
    libdbus-1-3 \
    libgbm1 \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libglib2.0-dev \
    libssl-dev \
    libx11-xcb1 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-shape0 \
    libxcb-shm0 \
    libxcb-xfixes0 \
    libxcb-xtest0 \
    libxfixes3 \
    pkgconf \
    tar \
    unzip \
    zip \
    python3.10 \
    python3-pip \
    wget

# Install ALSA
RUN apt-get install -y libasound2 libasound2-plugins alsa alsa-utils alsa-oss

# Install Pulseaudio
RUN apt-get install -y  pulseaudio pulseaudio-utils

## Install Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

FROM base AS deps



WORKDIR /opt
RUN git clone --depth 1 https://github.com/Microsoft/vcpkg.git \
    && ./vcpkg/bootstrap-vcpkg.sh -disableMetrics \
    && ln -s /opt/vcpkg/vcpkg /usr/local/bin/vcpkg \
    && vcpkg install vcpkg-cmake

# Download cpptoml.h to include directory
RUN mkdir -p $cwd/include \
    && wget https://raw.githubusercontent.com/skystrife/cpptoml/master/include/cpptoml.h -P $cwd/include/

FROM deps AS build

# COPY meeting-sdk-linux-sample/ $cwd/meeting-sdk-linux-sample

# COPY requirements.txt $cwd/requirements.txt

# Ensure the meeting-sdk-linux-sample directory is in the same directory as the Dockerfile


# Ensure the requirements.txt file is in the same directory as the Dockerfile
# COPY requirements.txt $cwd/
# Install ngrok
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-stable-linux-amd64.zip \
    && unzip ngrok-stable-linux-amd64.zip \
    && mv ngrok /usr/local/bin/ngrok \
    && rm ngrok-stable-linux-amd64.zip

# Assuming you have ngrok installed in your Dockerfile
COPY ngrok.yml /root/.ngrok2/ngrok.yml

WORKDIR $cwd

COPY . .

RUN pip install --no-cache-dir -r ./requirements.txt

# Install libcurl for HTTP requests
RUN apt-get update && apt-get install -y libcurl4-openssl-dev







EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

# ENTRYPOINT ["/tini", "--", "./bin/entry.sh"]


