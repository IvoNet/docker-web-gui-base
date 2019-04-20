#!/usr/bin/with-contenv bash

USERID=${USER_ID:-99}
GROUPID=${GROUP_ID:-100}
groupmod -g $GROUPID users
usermod -u $USERID nobody
usermod -g $GROUPID nobody
usermod -d /nobody nobody
chown -R nobody:users /nobody/
