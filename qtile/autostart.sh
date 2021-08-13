#!/bin/sh
picom --config ~/.config/picom/picom.conf &
setxkbmap es &
feh --randomize --no-fehbg --bg-fill ~/pictures/wallpapers/* &
VBoxClient-all &
