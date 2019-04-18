#!/usr/bin/env bash

# Window manager Openbox
$agi vnc4server \
    x11-xserver-utils \
    openbox \
    xfonts-base \
    xfonts-100dpi \
    xfonts-75dpi \
    libfuse2

mkdir -p /nobody/.cache/openbox/sessions
mkdir -p /nobody/.config/openbox

cp -v files/openbox/* /nobody/.config/openbox/
