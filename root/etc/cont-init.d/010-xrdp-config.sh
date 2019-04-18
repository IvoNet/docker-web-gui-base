#!/usr/bin/with-contenv bash

exec 2>&1
RSAKEYS=/etc/xrdp/rsakeys.ini

# Check for rsa key
if [ ! -f $RSAKEYS ] || cmp $RSAKEYS /usr/share/doc/xrdp/rsakeys.ini > /dev/null; then
    echo "Generating xrdp RSA keys..."
    (umask 077 ; xrdp-keygen xrdp $RSAKEYS)
    chown root:root $RSAKEYS
    if [ ! -f $RSAKEYS ] ; then
        echo "could not create $RSAKEYS"
        exit 1
    fi
    echo "done"
fi
