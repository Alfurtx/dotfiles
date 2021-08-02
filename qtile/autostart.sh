#!/bin/sh
picom --config ~/.config/picom/picom.conf &
setxkbmap es &
feh --randomize --bg-fill ~/pictures/wallpapers/* &
VBoxClient-all &
