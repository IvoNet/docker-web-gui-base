#!/usr/bin/env bash

export LC_ALL=C
export DEBIAN_FRONTEND="noninteractive"

export agi='apt-get install -y -q --no-install-recommends'

# Fix locale
locale-gen en_US
update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8
echo -n en_US.UTF-8 > /etc/container_environment/LANG
echo -n en_US.UTF-8 > /etc/container_environment/LC_CTYPE
