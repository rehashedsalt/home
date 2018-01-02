#!/usr/bin/env bash
uname -r | grep -q "ARCH" || exit
CHECKUPDATES_DB=/tmp/$(uuidgen)/
numupdates=$(checkupdates | wc -l)
echo $numupdates
