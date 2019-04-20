#!/usr/bin/env bash

# https://guacamole.apache.org/doc/gug/installing-guacamole.html
# https://guacamole.apache.org/doc/0.9.0/gug/installing-guacamole.html

curl -s -L -o /var/lib/tomcat8/webapps/ROOT.war "http://mirror.novg.net/apache/guacamole/1.0.0/binary/guacamole-1.0.0.war"

mkdir -p /etc/guacamole/extensions/ 2>/dev/null
mkdir -p /etc/guacamole/lib/ 2>/dev/null

curl -s -L "http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/1.0.0/binary/guacamole-auth-jdbc-1.0.0.tar.gz" | tar xz -C /opt/

mv -v /opt/guacamole-auth-jdbc-1.0.0/mysql/guacamole-auth-jdbc-mysql-1.0.0.jar /etc/guacamole/extensions/

curl -s -L -o /etc/guacamole/lib/mysql-connector-java-5.1.47.jar "http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.47/mysql-connector-java-5.1.47.jar"

cp -v files/guacamole/* /etc/guacamole

