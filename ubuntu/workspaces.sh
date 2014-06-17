#!/usr/bin/env bash
# add 9x9 workspace by default
# http://askubuntu.com/a/447689/194406 | http://askubuntu.com/a/260513
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 3
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 3

# Meta (or windows key) vs Ctrl+Alt
# Ctrl+Alt+Shift+[something] is bad for fingers, Meta+Shift is better but Meta
# is harder to unset for all kinds of things like Meta+S. Better to get
# something nice in the long run though, so I have decided to use Meta instead.

# Meta+WASD move around, Meta+Shift+WASD move windows around.
# It's nice to be able to change workspaces with just one hand.
# TODO WASD controls

# TODO Add HJKL support together with WASD (is this even possible?)

# TODO ctrl+alt+[numpad] or meta+[numpad] goes directly to workspaces
# (meta+Num7 to top left, meta+Num3 to bottom right, etc)

