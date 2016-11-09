#!/usr/bin/env bash

## Map of what the function keys are supposed to do
# F1  is ingrained as the help key in every piece of software on the planet
#     so I won't bother trying to change it
# F2  is unassigned
# F3  is unassigned
# F4  switches between cpp and h files (vimrc)
# F5  is for removing trailing whitespace
# F6  is for sending selected lines to xclip (vimrc)
# F7  is write to xclip from vim in visual mode
# F8  is media previous # TODO automatically set media keys
# F9  is media pause
# F10 is media next
# F11 is for setting fullscreen mode
# F12 is for toggling paste mode in vim (vimrc)

# TODO Shift+Alt L switch to next source
# I tend to switch between a Finnish keyboard layout with umlauts
# and an American layout for programming

# Turn capslock into escape
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

# disable F1 as help



# disable super key
# http://askubuntu.com/a/235143/194406
# works on 14.04
dconf write /org/compiz/profiles/unity/plugins/unityshell/show-launcher '""'
# http://askubuntu.com/a/235143/194406
# tested this and did not work
gconftool-2 --set "/apps/compiz-1/plugins/unityshell/screen0/options/show_launcher" --type string ""
# http://askubuntu.com/a/406153/194406
gconftool-2 --set "/apps/compiz-1/plugins/unityshell/screen0/options/shortcut_overlay" --type boolean false

# disable alt
dconf write /org/compiz/integrated/show-hud '[""]'

# disable super+w
gconftool-2 --set "/apps/compiz-1/plugins/scale/screen0/options/initiate_key" --type string ""
# super+shift+w
gconftool-2 --set "/apps/compiz-1/plugins/scale/screen0/options/initiate_all_key" --type string ""

gsettings set org.gnome.desktop.wm.keybindings panel-main-menu []

# super+q and super+e lower and raise windows
gsettings set org.gnome.desktop.wm.keybindings lower "['<Super>q']"
gsettings set org.gnome.desktop.wm.keybindings raise "['<Super>e']"
