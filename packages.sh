#!/bin/bash
PACKAGES="
sudo
screen
curl
rsync
moreutils
build-essential
unzip
nmap
unrar
nano
ntp
dialog
"

apt-get update
apt-get install $PACKAGES

