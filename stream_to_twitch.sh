#!/bin/bash

# Stop any running Xvfb server
killall Xvfb

# Remove lock files
rm -f /tmp/.X99-lock
rm -f /tmp/.X11-unix/X99

# Set up and run Xvfb with appropriate resolution
Xvfb :99 -screen 0 1920x1080x24 &
export DISPLAY=:99

# Wait a moment while `Xvfb` starts
sleep 2

# Start Openbox to provide a window environment
openbox &

# Optional: Start x11vnc for debugging (default port 5900)
x11vnc -display :99 -noipv6 -forever &

# Run Chromium in full screen mode
google-chrome --no-sandbox --disable-gpu --disable-software-rasterizer --disable-dev-shm-usage --disable-fre --no-default-browser-check --no-first-run --test-type \
--window-size=1920x1080 --start-fullscreen "${YOUR_WEBSITE_URL}" &

# Wait a moment to make sure the page has loaded
sleep 5

# Start FFmpeg to capture the virtual screen and stream to Twitch
ffmpeg -f x11grab -s 1920x1080 -framerate 30 -i :99 \
-vcodec libx264 -preset veryfast -maxrate 2000k -bufsize 4000k \
-pix_fmt yuv420p -g 60 -f flv rtmp://live.twitch.tv/app/${TWITCH_API_KEY}