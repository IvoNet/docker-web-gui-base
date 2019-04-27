#!/usr/bin/env bash

# clean and reinstall pulseaudio
apt-get remove -y --purge alsa-base pulseaudio
# fixes user folder permissions

$agi pulseaudio \
     alsa-base \
     dbus \
     dbus-x11

mkdir -p /nobody/.config/pulse 2>/dev/null
dbus-uuidgen > /var/lib/dbus/machine-id
