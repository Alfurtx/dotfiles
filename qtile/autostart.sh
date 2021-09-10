#!/bin/sh

# Window composer
picom --experimental-backends --config ~/.config/picom/picom.conf &

# el layout ESPAÑOL!!
setxkbmap es &

# randomize wallpapers
feh --randomize --no-fehbg --bg-fill ~/pictures/wallpapers/* &

# para que no se vuelva lento el scroll del raton
solaar --window=hide &
