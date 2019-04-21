#!/usr/bin/with-contenv bash

echo "Creating Guacamole connection..."

# Connection name
if [ -z $APPNAME ]; then
    export APPNAME=DESKTOP_APPLICATION
    if [[ -e /startapp.sh ]]; then
        if grep -q "/usr/bin/xeyes" "/startapp.sh"; then
          export APPNAME=eyes
        fi
    fi
    echo "APPNAME not set defaulting to: ${APPNAME}"
fi

sed -i "s~DESKTOP_APPLICATION~$APPNAME~g" /mysql-entrypoint-initdb.d/050-vnc-connection.sql
sed -i "s~DESKTOP_APPLICATION~$APPNAME~g" /etc/xrdp/xrdp.ini
