#!/usr/bin/env bash

[[ -z "$(brew ls --versions pulseaudio)" ]] && brew install pulseaudio
pulseaudio --kill 2>/dev/null
pulseaudio --load=module-native-protocol-tcp --exit-idle-time=-1 --daemon 2>/dev/null


docker run                                      \
    -d                                          \
    --rm                                        \
    --name vlc                                  \
    -e PULSE_SERVER=docker.for.mac.localhost    \
    -v ~/.config/pulse:/nobody/.config/pulse    \
    -p 8080:32000                               \
    -v /Users/ivonet/dev/ivonet-talks/docker/Docker.Fun:/video       \
    -e VNC_DEPTH=24                             \
    ivonet/vlc-dev

echo "Login with: vlc/secret"
sleep 5
open http://localhost:8080
