#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y install nodejs
# put a symlink so we can use node instead of nodejs (good for scripts also)
# http://stackoverflow.com/a/18130296
sudo ln -s "$(which nodejs)" /usr/bin/node
sudo apt-get -y install npm
