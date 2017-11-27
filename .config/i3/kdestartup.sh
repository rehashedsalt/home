#!/bin/bash
polybar -r gamma &

compton &
dunst &

redshift &
mopidy &

xrdb ~/.Xresources
killall plasmashell
