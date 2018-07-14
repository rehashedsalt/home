#!/bin/sh

# Copyright (c) 2017 rehashedsalt/vintagesalt
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# POSIX NOTICE
# This script should be fully POSIX-compliant
# If it is not, open a bug report at github.com/rehashedsalt/home and I'll take
# care of it

# If emerge exists, add emerge aliases
if [ `which emerge` ]; then
	alias e-depclean='sudo emerge -a --depclean'
	alias e-inst='sudo emerge -a --jobs --tree'
	alias e-upgrade='sudo emerge -DNuva --jobs --tree --with-bdeps=y @world'
	alias e-search='emerge -s'
	alias e-sync='sudo emerge --sync'

	alias e-cleanup='sudo eclean -d distfiles && sudo eclean -d packages'
else
	alias emerge='"emerge" was not found. Does the system use portage at all?'
fi

# Add an alias for lsblk, since I tend to use that
if [ `which lsblk` ]; then
	alias lsblk='lsblk -p'
	alias lsblkf='lsblk -pf'
fi

# If pacman exists, check for helpers and add aliases
if [ "`which pacman > /dev/null 2>&1`" ]; then
	export pac_helper="pacaur"
	helpers="pacaur yaourt pacman"
	for helper in $helpers; do
		if [ "$(pacman -Qq "$helper" > /dev/null)" ]; then
			export pac_helper="$helper"
			break
		fi
	done
	
	alias pac="\$pac_helper"
	alias pacq="\$pac_helper -Qs"
	alias pacqi="\$pac_helper -Qi"
	alias pacs="\$pac_helper -S"
	alias pacss="\$pac_helper -Ss"
	alias pacsu="\$pac_helper -Syu"
	alias pacsyu="\$pac_helper -Syyu"
	alias pacsr="\$pac_helper -Rsnu"
	unset helpers
fi

# Alias for the dotfile setup
if [ -d "$HOME/.dotfiles" ]; then
	alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
fi

# Aliases for common utilities
alias cp='cp -i'

if [ "`uname`" = "Linux" ]; then
	lsarguments='--color=auto --group-directories-first'
	alias l="ls -CF  --file-type $lsarguments"
	alias la="ls -AF  --file-type $lsarguments"
	alias ls="ls -F $lsarguments"
	alias ll="ls -AhlF  --file-type $lsarguments"
	unset lsarguments
else
	lsarguments='-F'
	alias l="ls -$lsarguments"
	alias la="ls -A $lsarguments"
	alias ls="ls $lsarguments"
	alias ll="ls -Ahl $lsarguments"
fi

if `which sudo`; then
	alias fug='sudo `history -p !!`'
fi

alias waitwhat='echo $?'

# urxvt isn't a very well-known terminal
if [ "$TERM" = "rxvt-unicode-256color" ]; then
	export TERM=xterm-256color
fi

# Minor configuration settings
export EDITOR=`which vim`
export PATH=$PATH:$HOME/.local/bin
export XDG_CONFIG_HOME="$HOME/.config"
