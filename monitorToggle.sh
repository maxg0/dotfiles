#!/usr/bin/env bash

# You need to set these to the corresponding monitors of your setup.
# You can figure them out with `xrandr` and guessing.
primary=DVI-I-2
secondary=DVI-I-3

monitorStatus=$(xrandr | grep $secondary | sed "s/.* connected //g" | sed "s/(.*)//g")

if [ "$monitorStatus" != "" ]; then
    # monitor is on, so we turn it off
    xrandr --output $primary --auto --output $secondary --off
else
    # monitor is off, so we turn it on
    xrandr --output $primary --auto --output $secondary --auto --right-of $primary
fi
