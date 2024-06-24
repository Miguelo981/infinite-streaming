FROM --platform=linux/amd64 ubuntu:22.04

RUN apt-get update && \
    apt-get install -y wget gnupg

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    google-chrome-stable xvfb ffmpeg pulseaudio x11vnc xorg openbox x11-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sh", "/home/start_stream.sh"]