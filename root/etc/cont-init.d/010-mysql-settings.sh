#!/usr/bin/with-contenv bash

echo "Setting MySql environment..."
export MYSQL_ROOT_PASSWORD=secret
export DATADIR=/var/lib/mysql
export MYSQL_ROOT_HOST=localhost
export MYSQL_DATABASE=guacamole_db
export MYSQL_USER=guacadmin
export MYSQL_PASSWORD=guacadmin
