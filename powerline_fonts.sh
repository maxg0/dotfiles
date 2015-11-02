#!/usr/bin/env bash

mkdir -p ~/.local/share/fonts
wget -O ~/.local/share/fonts/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
sudo fc-cache -f -v

mkdir -p ~/.config/fontconfig/fonts.conf
wget -O ~/.config/fontconfig/fonts.conf/10-powerline-symbols.conf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf


