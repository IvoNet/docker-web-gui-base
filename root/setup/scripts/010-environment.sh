#!/usr/bin/env bash

export LC_ALL=C
export DEBIAN_FRONTEND="noninteractive"
export PYTHONDONTWRITEBYTECODE=1

export agi='apt-get install -y -q --no-install-recommends'

# Fix locale
locale-gen en_US
update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8

#https://github.com/inversepath/usbarmory-debian-base_image/issues/9
mkdir ~/.gnupg
echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf

apt-get update
