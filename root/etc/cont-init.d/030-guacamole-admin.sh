#!/usr/bin/with-contenv bash

echo "Setting guacamole users..."

# Guacamole admin user
if [ -z $GUACAMOLE_ADMIN_USERNAME ]; then
    export GUACAMOLE_ADMIN_USERNAME=guacadmin
    echo "GUACAMOLE_ADMIN_USERNAME not set defaulting to: ${GUACAMOLE_ADMIN_USERNAME}"
fi
sed -i "s~GUACAMOLE_ADMIN_USERNAME~$GUACAMOLE_ADMIN_USERNAME~g" /mysql-entrypoint-initdb.d/030-create-admin-user.sql

if [ -z $GUACAMOLE_ADMIN_PASSWORD ]; then
    export GUACAMOLE_ADMIN_PASSWORD=guacadmin
    echo "GUACAMOLE_ADMIN_PASSWORD not set defaulting to: ${GUACAMOLE_ADMIN_PASSWORD}"
fi
sed -i "s~GUACAMOLE_ADMIN_PASSWORD~$GUACAMOLE_ADMIN_PASSWORD~g" /mysql-entrypoint-initdb.d/030-create-admin-user.sql

# Guacamole user
if [ -z $GUACAMOLE_USER_NAME ]; then
    export GUACAMOLE_USER_NAME=guest
    echo "GUACAMOLE_USER_NAME not set defaulting to: ${GUACAMOLE_USER_NAME}"
fi
sed -i "s~GUACAMOLE_USER_NAME~$GUACAMOLE_USER_NAME~g" /mysql-entrypoint-initdb.d/040-create-user.sql

if [ -z $GUACAMOLE_USER_PASSWORD ]; then
    export GUACAMOLE_USER_PASSWORD=secret
    echo "GUACAMOLE_USER_PASSWORD not set defaulting to: ${GUACAMOLE_USER_PASSWORD}"
fi
sed -i "s~GUACAMOLE_USER_PASSWORD~$GUACAMOLE_USER_PASSWORD~g" /mysql-entrypoint-initdb.d/040-create-user.sql
