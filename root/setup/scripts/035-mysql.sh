#!/usr/bin/env bash


echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-5.7" >/etc/apt/sources.list.d/mysql.list
echo "deb-src http://repo.mysql.com/apt/debian/ stretch mysql-5.7" >> /etc/apt/sources.list.d/mysql.list
curl -s -L -o /tmp/RPM-GPG-KEY-mysql https://repo.mysql.com/RPM-GPG-KEY-mysql
apt-key add /tmp/RPM-GPG-KEY-mysql
apt-get update
cat /etc/apt/sources.list.d/mysql.list
$agi mysql-server

