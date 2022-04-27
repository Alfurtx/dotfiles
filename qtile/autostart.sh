#!/bin/sh

# multimonitor setup
~/.config/screenlayout/screenlayout.sh
xrdb -merge ~/.config/xorg/xresources

# Window composer
picom --experimental-backends --config ~/.config/picom/picom.conf &

setxkbmap es &

# randomize wallpapers
feh --randomize --no-fehbg --bg-fill ~/pictures/wallpapers/* &

# para que no se vuelva lento el scroll del raton
solaar --window=hide &

# doom emacs (daemon)
# /usr/bin/emacs --daemon 2> /dev/null
