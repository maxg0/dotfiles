#!/bin/bash

# disable super key
# http://askubuntu.com/a/235143/194406
gconftool-2 --set "/apps/compiz-1/plugins/unityshell/screen0/options/show_launcher" --type string ""

# disable alt
# http://customizeubuntu.com/preferences/keyboard-shortcuts/disable-hud-when-pressing-alt-key
gconftool-2 --set "/apps/compiz-1/plugins/unityshell/screen0/options/show_hud" --type string ""
