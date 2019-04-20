#!/usr/bin/with-contenv bash

if [ -z $DISPLAY ]; then
    export DISPLAY=:1
fi
