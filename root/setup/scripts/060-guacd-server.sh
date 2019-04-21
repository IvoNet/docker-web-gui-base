#!/usr/bin/env bash

# Optional dependencies
$agi libavcodec-dev \
     libavutil-dev \
     libswscale-dev \
     libfreerdp-dev \
     libpango1.0-dev \
     libssh2-1-dev \
     libvncserver-dev \
     libpulse-dev \
     libssl-dev \
     libvorbis-dev \
     libwebp-dev

$agi libguac-client-ssh0 \
     libguac-client-rdp0 \
     libguac-client-telnet0 \
     libguac-client-vnc0

#Guacamole Server
$agi guacd

