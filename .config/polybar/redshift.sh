#!/bin/bash

pgrep -x redshift &> /dev/null
if [[ $? -eq 0 ]]; then
    temp=$(redshift -p 2>/dev/null | grep temp | cut -d' ' -f3)
    temp=${temp//K/}
fi

# OPTIONAL: Append ' ${temp}K' after $icon
if [[ -z $temp ]]; then
    echo ""       # Not running
elif [[ $temp -ge 5000 ]]; then
    echo "*"       # Blue
elif [[ $temp -ge 4000 ]]; then
    echo "**"       # Yellow
else
    echo "***"       # Orange
fi
