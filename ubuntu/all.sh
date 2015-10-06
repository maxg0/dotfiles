#!/usr/bin/env bash
# this is ran from parent directory
directory=$(basename "$PWD")
$directory/keyboard.sh
$directory/mouse.sh
$directory/misc.sh
$directory/workspaces.sh
$directory/fixubuntu.sh
