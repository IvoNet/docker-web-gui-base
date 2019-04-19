#!/usr/bin/env bash

$agi libatinject-jsr330-api-java \
     tomcat8

rm -Rf /var/lib/tomcat8/webapps/ROOT
mkdir -p /var/cache/tomcat8
mkdir -p /tmp/tomcat8-tomcat8-tmp

