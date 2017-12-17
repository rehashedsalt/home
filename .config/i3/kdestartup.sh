#!/bin/bash
compton &
dunst &

redshift &
mopidy &

xrdb ~/.Xresources
killall plasmashell
feh --randomize --bg-fill ~/Pictures/Wallpapers/i3
