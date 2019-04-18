#!/usr/bin/with-contenv bash

mkdir -p /nobody/.config/openbox 2>/dev/null
cp /etc/openbox/* /nobody/.config/openbox
chown nobody:users /nobody/.config/openbox/rc.xml 2>/dev/null
