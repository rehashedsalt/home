#!/bin/bash
xrdb ~/.Xresources &

killall plasmashell &
killall krunner &

redshift &
mopidy &
