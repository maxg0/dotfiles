#!/usr/bin/env bash

# Not quite sure if this is needed but added it anyways.
dconf write /org/compiz/profiles/unity/plugins/unityshell/num-launchers 1

# You need to set these to the corresponding monitors of your setup.
# You can figure them out with `xrandr` and guessing.
primary=HDMI-0
secondary=DVI-D-0

monitorStatus=$(xrandr | grep $secondary | sed "s/.* connected //g" | sed "s/(.*)//g")

if [ "$monitorStatus" != "" ]; then
    # monitor is on, so we turn it off
    xrandr --output $primary --auto --output $secondary --off
else
    # monitor is off, so we turn it on
    # The --primary switch here is for launcher placement.
    xrandr --output $primary --auto --output $secondary --auto --left-of $primary --primary
fi
