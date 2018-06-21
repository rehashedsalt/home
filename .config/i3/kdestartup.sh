#!/bin/bash
xrdb ~/.Xresources &

killall plasmashell &
killall krunner &
killall xembedsniproxy &

redshift &
mopidy &
