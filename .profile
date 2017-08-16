#!/bin/sh

# POSIX NOTICE
# This script should be fully POSIX-compliant
# If it is not, open a bug report at github.com/rehashedsalt/home and I'll take
# care of it

# dcfldd is a fork of dd with some improvements
# I prefer it, so there's an alias here
if [ `which dcfldd` ]; then
	alias dd=dcfldd
	alias ddgnu=dd
fi

# If emerge exists, add emerge aliases
if [ `which emerge` ]; then
	alias e-depclean='sudo emerge -a --depclean'
	alias e-inst='sudo emerge -av'
	alias e-upgrade='sudo emerge -DNuva --with-bdeps=y @world'
	alias e-search='emerge -s'
	alias e-sync='sudo emerge --sync'
fi

if [ `which neofetch` ]; then
	alias fetch='neofetch --disable model resolution --block_range 0 15 --image wall --xoffset 4 --yoffset 4 --scrot ~/Pictures/Screenshots/neofetch.png'
	alias fetch-up='neofetch --disable model resolution --block_range 0 15 --image wall --xoffset 4 --yoffset 4 --upload --image-host imgur'
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
	alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
fi

# Aliases for common utilities
alias cp='cp -i'
alias l='ls -CF --color=auto --file-type'
alias la='ls -AF --color=auto --file-type'
alias ls='ls -F --color=auto'
alias ll='ls -AhlF --color=auto --file-type'
alias waitwhat='echo $?'
alias fug='sudo `history -p !!`'

# urxvt isn't a very well-known terminal
if [ "$TERM" = "rxvt-unicode-256color" ]; then
	export TERM=xterm-256color
fi

# Minor configuration settings
export EDITOR=$(which vim)
export PATH=$PATH:$HOME/.bin:$HOME/.local/bin
