#!/usr/bin/with-contenv bash

echo "Setting guacamole users..."

# Guacamole admin user
if [ -z $GUACAMOLE_ADMIN_USERNAME ]; then
    export GUACAMOLE_ADMIN_USERNAME=admin
    echo "GUACAMOLE_ADMIN_USERNAME not set defaulting to: ${GUACAMOLE_ADMIN_USERNAME}"
fi
sed -i "s~GUACAMOLE_ADMIN_USERNAME~$GUACAMOLE_ADMIN_USERNAME~g" /etc/guacamole/user-mapping.xml

if [ -z $GUACAMOLE_ADMIN_PASSWORD ]; then
    export GUACAMOLE_ADMIN_PASSWORD=secret
    echo "GUACAMOLE_ADMIN_PASSWORD not set defaulting to: ${GUACAMOLE_ADMIN_PASSWORD}"
fi
sed -i "s~GUACAMOLE_ADMIN_PASSWORD~$GUACAMOLE_ADMIN_PASSWORD~g" /etc/guacamole/user-mapping.xml
