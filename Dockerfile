#FROM ubuntu:22.04
FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    xvfb ffmpeg pulseaudio chromium-browser x11vnc xorg openbox x11-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sh", "/home/stream_to_twitch.sh"]