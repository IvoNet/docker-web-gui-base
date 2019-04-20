#!/usr/bin/with-contenv bash

echo "Creating Guacamole connection..."

# Connection name
if [ -z $APPLICATION_NAME ]; then
    export APPLICATION_NAME=DESKTOP_APPLICATION
    echo "APPLICATION_NAME not set defaulting to: ${APPLICATION_NAME}"
fi
sed -i "s~DESKTOP_APPLICATION~$APPLICATION_NAME~g" /mysql-entrypoint-initdb.d/050-vnc-connection.sql
sed -i "s~DESKTOP_APPLICATION~$APPLICATION_NAME~g" /etc/xrdp/xrdp.ini
