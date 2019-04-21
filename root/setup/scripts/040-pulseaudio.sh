#!/usr/bin/env bash

$agi pulseaudio \
     dbus

mkdir -p /nobody/.config/pulse 2>/dev/null
dbus-uuidgen > /var/lib/dbus/machine-id
