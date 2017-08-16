#!/bin/sh

# POSIX NOTICE
# This script is not fully POSIX-compliant. It uses features that,
# while popular, are undefined by POSIX. Namely:
#
# * The use of the `local` keyword
#
# Users of this script on minimalist shells will have to adapt
# this script accordingly.

# Common miscellaneous aliases are all defined here for convenience
__define_aliases() {

    # Common Aliases
    
    alias cp='cp -i'
    if [ `which dcfldd` ]; then
    	alias dd=dcfldd
    fi
    alias ls='ls --color=auto'
    alias ll='ls -alF'
    alias la='ls -a --color=auto'
    alias l='ls -CF'
    alias waitwhat='echo $?'

    alias fug='sudo `history -p !!`'
}

# Functions to be exported to the shell
# Mostly just helper wrappers and such
__define_functions() {
    # Arch-only helper functions
    if [ "$(which pacman > /dev/null 2>&1)" ]; then
        export PAC_HELPER="pacaur"
        local helpers="pacaur yaourt pacman"
        for helper in $helpers; do
            if [ "$(pacman -Qq "$helper" > /dev/null)" ]; then
                export PAC_HELPER="$helper"
                break
            fi
        done
        
        alias pac="\$PAC_HELPER"
        alias pacq="\$PAC_HELPER -Qs"
        alias pacqi="\$PAC_HELPER -Qi"
        alias pacs="\$PAC_HELPER -S"
        alias pacss="\$PAC_HELPER -Ss"
        alias pacsu="\$PAC_HELPER -Syu"
        alias pacsyu="\$PAC_HELPER -Syyu"
        alias pacsr="\$PAC_HELPER -Rsnu"
    fi
}

# Call functions that need to be called
__define_aliases
__define_functions

if [ "$TERM" = "rxvt-unicode-256color" ]; then
	export TERM=xterm-256color
fi

EDITOR=$(which vim)
PATH=$PATH:$HOME/.bin:$HOME/.local/bin
export EDITOR
export PATH
