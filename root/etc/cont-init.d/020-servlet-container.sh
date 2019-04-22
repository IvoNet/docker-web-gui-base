#!/usr/bin/with-contenv bash


mkdir -p /var/cache/tomcat8 2>/dev/null
mkdir -p /tmp/tomcat8-tomcat8-tmp 2>/dev/null

PORT=${SERVER_PORT:-32000}
sed -i "s~<Connector port=\"8080\" protocol=\"HTTP/1.1~<Connector port=\"${PORT}\" protocol=\"HTTP/1.1~g" /var/lib/tomcat8/conf/server.xml
