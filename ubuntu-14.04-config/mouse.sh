#!/usr/bin/env bash

# focus mode sloppy works well with alt tabbing
# instead of auto raise, use keyboard super+q and super+e
# http://askubuntu.com/a/64606
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
