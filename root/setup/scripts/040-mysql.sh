#!/usr/bin/env bash


echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-5.7" >/etc/apt/sources.list.d/mysql.list
echo "deb-src http://repo.mysql.com/apt/debian/ stretch mysql-5.7" >> /etc/apt/sources.list.d/mysql.list
wget -O /tmp/RPM-GPG-KEY-mysql https://repo.mysql.com/RPM-GPG-KEY-mysql
apt-key add /tmp/RPM-GPG-KEY-mysql
apt update
cat /etc/apt/sources.list.d/mysql.list
$agi mysql-server

chown -R nobody:root /var/log/mysql/
chown -R nobody:root /var/lib/mysql/
chown -R nobody:root /var/run/mysqld/

#
#
#MYSQL_MAJOR=8.0
#MYSQL_VERSION=8.0.15-1debian9
#
#
#groupadd -r mysql
#useradd -r -g mysql mysql
#
#$agi gnupg dirmngr
#
#mkdir /docker-entrypoint-initdb.d
#
#$agi pwgen \
#     openssl \
#     perl
#
## gpg: key 5072E1F5: public key "MySQL Release Engineering <mysql-build@oss.oracle.com>" imported
#key='A4A9406876FCBD3C456770C88C718D3B5072E1F5'
#export GNUPGHOME="$(mktemp -d)"
#gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"
#gpg --batch --export "$key" > /etc/apt/trusted.gpg.d/mysql.gpg
#gpgconf --kill all
#rm -rf "$GNUPGHOME"
#apt-key list > /dev/null
#
#echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list
#
#{ 		echo mysql-community-server mysql-community-server/data-dir select ''; \
#		echo mysql-community-server mysql-community-server/root-pass password ''; \
#		echo mysql-community-server mysql-community-server/re-root-pass password ''; \
#		echo mysql-community-server mysql-community-server/remove-test-db select false; \
#	} | debconf-set-selections
#
#
#$agi mysql-community-client="${MYSQL_VERSION}" mysql-community-server-core="${MYSQL_VERSION}"
#
#
#rm -rf /var/lib/mysql
#mkdir -p /var/lib/mysql /var/run/mysqld
#chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
#chmod 777 /var/run/mysqld
#
