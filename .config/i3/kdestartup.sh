#!/bin/bash
xrdb ~/.Xresources &
killall xembedsniproxy &
feh --randomize --bg-fill ~/Pictures/Wallpapers/i3 &

dunst &

redshift &
mopidy &
