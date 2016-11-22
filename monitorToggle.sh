#!/usr/bin/env bash

# this script is very system dependent and will probably not work

monitorStatus=$(xrandr | grep DVI-I-1 | sed "s/.* connected //g" | sed "s/(.*)//g")

if [ "$monitorStatus" != "" ]; then
    # monitor is on, so we turn it off
    xrandr --output DVI-I-2 --auto --output DVI-I-1 --off
else
    # monitor is off, so we turn it on
    xrandr --output DVI-I-2 --auto --output DVI-I-1 --auto --right-of DVI-I-2
fi
