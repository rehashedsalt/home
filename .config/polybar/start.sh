#!/bin/bash
#
# start.sh
# Copyright (C) 2018 salt <salt@iridium>
#
# Distributed under terms of the MIT license.
#
export PB_WM_RESTACK=bspwm

# Iterate through monitors and spawn bars on each
# Starting with the primary monitor...
export PB_MONITOR=$(xrandr -q | awk '/\<primary\>/{print $1}')
if [[ $PB_MONITOR == "" ]]; then
	unset PB_MONITOR
fi
printf '[INFO] Starting Polybar primary on monitor $PB_MONITOR'
polybar -r primary&
polybar -r primary-2&
# ...and then moving on to secondaries, if we have them
# Alright, now this looks *really* bad, spawning so many subprocesses, but
# there's no way in hell you can get me to attempt to solve this with regex.
# To hell with regex. It starts more problems than it solves
export secondary_monitors=$(xrandr -q | grep ' connected' | grep -v 'primary' | awk '{print $1}')
if [[ $secondary_monitors == "" ]]; then
	exit 0
fi
for monitor in $secondary_monitors; do
	printf '[INFO] Starting Polybar secondary on monitor $monitor'
	PB_MONITOR=$monitor polybar -r secondary
done

disown
exit
