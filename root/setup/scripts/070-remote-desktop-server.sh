#!/usr/bin/env bash

$agi vnc4server
$agi xrdp

mkdir /etc/xrdp 2>/dev/null
cp -rv /etc/xrdp /opt/
cp -v files/xrdp/* /etc/xrdp/

