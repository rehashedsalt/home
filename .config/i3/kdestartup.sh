#!/bin/bash
compton &
dunst &

redshift &
mopidy &

xrdb ~/.Xresources
killall plasmashell
