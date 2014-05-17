#!/usr/bin/env bash

# Installs Google Chrome
# http://askubuntu.com/a/79284/194406

sudo apt-add-repository 'deb http://dl.google.com/linux/deb/ stable main'

sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo apt-get update
sudo apt-get install google-chrome-stable
