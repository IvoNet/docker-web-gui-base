#!/usr/bin/env bash

pulseaudio --kill 2>/dev/null
docker rm -f vlc
