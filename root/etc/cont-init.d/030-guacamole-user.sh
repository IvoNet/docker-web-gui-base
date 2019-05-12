#!/usr/bin/with-contenv bash

echo "Setting guacamole users..."

if [ -f /etc/guacamole/extensions/ivonet-guacamole-docker-auto-login.jar ]; then
    echo "Using auto login feature..."
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

if [ -z $USERNAME ]; then
    export USERNAME=admin
    echo "USERNAME not set defaulting to: ${USERNAME}"
fi
sed -i "s~USERNAME~$USERNAME~g" /etc/guacamole/guacamole.properties
