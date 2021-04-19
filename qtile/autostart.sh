#!/bin/sh
picom --config ~/.config/picom/picom.conf &
setxkbmap es &
feh --randomize --bg-fill ~/Pictures/wallpapers/* &
VBoxClient-all &
~/.config/polybar/launch.sh $
