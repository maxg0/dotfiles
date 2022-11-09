#!/usr/bin/env bash

sudo apt install -y $(cat apt_packages.txt)
mkdir -p $HOME/.vimundo
./dotlinks.sh
