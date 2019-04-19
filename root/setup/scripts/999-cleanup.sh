#!/usr/bin/env bash



apt-get purge -y --auto-remove wget
apt-get purge -y --auto-remove
apt-get clean
rm -rf /var/lib/apt/lists/*
rm -f /etc/apt/sources.list.d/temp.list 2>/dev/null

find /usr -name '*.pyc' -type f -exec bash -c 'for pyc; do dpkg -S "$pyc" &> /dev/null || rm -vf "$pyc"; done' -- '{}' +

gosu nobody true
