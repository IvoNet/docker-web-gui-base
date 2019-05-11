#!/usr/bin/with-contenv bash

echo "Setting guacamole users..."

if [ -f /etc/guacamole/extensions/guacamole-authentication-extension-ivonet.jar ]; then
    echo "Using ivonet auth extentsion..."
    rm -f /etc/guacamole/user-mapping.xml 2>/dev/null
else
    # Guacamole admin user
    if [ -z $USERNAME ]; then
        export USERNAME=admin
        echo "USERNAME not set defaulting to: ${USERNAME}"
    fi
    sed -i "s~USERNAME~$USERNAME~g" /etc/guacamole/user-mapping.xml

    if [ -z $PASSWORD ]; then
        export PASSWORD=secret
        echo "PASSWORD not set defaulting to: ${PASSWORD}"
    fi
    sed -i "s~PASSWORD~$PASSWORD~g" /etc/guacamole/user-mapping.xml
fi

