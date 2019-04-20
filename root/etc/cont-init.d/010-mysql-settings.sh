#!/usr/bin/with-contenv bash

echo "Setting MySql environment..."

if [ -z $MYSQL_ROOT_PASSWORD ]; then
    export MYSQL_ROOT_PASSWORD=secret
fi
if [ -z $DATADIR ]; then
    export DATADIR=/var/lib/mysql
fi
if [ -z $MYSQL_ROOT_HOST ]; then
    export MYSQL_ROOT_HOST=localhost
fi
if [ -z $MYSQL_USER ]; then
    export MYSQL_USER=guacadmin
fi
if [ -z $MYSQL_PASSWORD ]; then
    export MYSQL_PASSWORD=guacadmin
fi


export MYSQL_DATABASE=guacamole_db
export MYSQL_USER=guacadmin
export MYSQL_PASSWORD=guacadmin
