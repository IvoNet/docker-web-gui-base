#!/usr/bin/with-contenv bash
if [[ $(cat /etc/timezone) != $TZ ]] ; then
  echo "$TZ" > /etc/timezone
  dpkg-reconfigure -f noninteractive tzdata
  export $TZ
fi


if [ -z $DISPLAY ]; then
    export DISPLAY=:1
fi

export HOME="/root"
export GUACD_LOG_LEVEL=error

chmod +x /startapp.sh 2>/dev/null
