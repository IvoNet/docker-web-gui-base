#!/usr/bin/env bash

[[ -z "$(brew ls --versions pulseaudio)" ]] && brew install pulseaudio
pulseaudio --kill 2>/dev/null
pulseaudio --load=module-native-protocol-tcp --exit-idle-time=-1 --daemon 2>/dev/null

echo "login with: guest/secret"

open http://localhost:8080

docker run                                      \
    -it                                         \
    --rm                                        \
    --name vlc                                  \
    -e PULSE_SERVER=docker.for.mac.localhost    \
    -v ~/.config/pulse:/nobody/.config/pulse    \
    -p 8080:8080                                \
    -v /Volumes/video/Series:/video             \
    -e VNC_DEPTH=24                             \
    ivonet/vlc

pulseaudio --kill 2>/dev/null
