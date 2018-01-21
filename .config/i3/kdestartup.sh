#!/bin/bash
xrdb ~/.Xresources &
killall plasmashell &
feh --randomize --bg-fill ~/Pictures/Wallpapers/i3 &

compton &
dunst &

redshift &
conky &
mopidy &
