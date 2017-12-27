#!/bin/sh

PROMPT_COMMAND="__prompt_command; $PROMPT_COMMAND"

__prompt_command() {
    PS1="$(powerline-shell.py --cwd-mode fancy --cwd-max-depth 3 --cwd-max-dir-size 16 --mode patched $? 2> /dev/null)"
}

# Command to be called every time PS1 is composed
# PROMPT_COMMAND makes this process very easy, it turns out
__prompt_command_old() {
    local EXIT="$?"
    PS1="\[\e[m\]"

    # Determine which separator we should use
    # Namely, don't use the Powerline separator if we know we're in a tty
    
    local SEPARATOR=""
    if [[ "$(tty)" == *"tty"* ]]; then
        SEPARATOR=" "
    else
        SEPARATOR=""
    fi
    
    # Generate the name color based on remote connection and root statuses
    if [ "$(id -u)" == "0" ]; then
        # We're root, gimme the flashy red prompt
        PS1+="\[\e[37;41m\]"
    else
        # Generate a background based on remote status
        if [ -z "${SSH_TTY+x}" ]; then
            #Light Grey on Light Blue (BG)
            PS1+="\[\e[104m\]"
        else
            #Light Grey on Magenta (BG)
            PS1+="\[\e[45m\]"
        fi
        # Generate a foreground based on whether or not we're in sudoers or wheel or whatever
        # Unfortunately, there's no way for us to *really* check if we can sudo or not
        local admgroups=( "wheel" "root" "sudo" )
        PS1+="\[\e[30m\]"
        for usergroup in $(groups); do
            for admgroup in $admgroups; do
                if [ "$usergroup" == "$admgroup" ]; then
                    PS1+="\[\e[39m\]"
                fi
            done
        done
        #if [[ $USERGROUPS == *"wheel"* ]] || [[ $USERGROUPS == *"root"* ]] || [[ $USERGROUPS == *"sudo"* ]]; #then
        #    PS1+="\[\e[37m\]"
        #else
        #   PS1+="\[\e[30m\]"
        #fi
    fi

    # Generate a name based on the remote connection and username
    PS1+=" "
    if [ -z "${SSH_TTY+x}" ]; then
        PS1+="$USER"
    else
        if [ "$USER" != "salt" ]; then
            PS1+="$USER@"
        fi
        PS1+="$HOSTNAME"
    fi

    # Transition to PWD
    PS1+=" \[\e[7;90m\]$SEPARATOR\[\e[m\e[100m\]"

    # Generate the PWD
    PS1+="${PWD/#$HOME/'~'}"

    # Append a neat little arrow suffix
    if [ $EXIT == 0 ]; then
        #32: Green
        PS1+="\[\e[7;32m\]$SEPARATOR\[\e[m\e[32m\]$SEPARATOR"
    else
        #31: Red
        PS1+="\[\e[7;31m\]$SEPARATOR\[\e[0;39;41m\]$EXIT\[\e[m\e[31m\]$SEPARATOR"
    fi

    # Cleanup
    PS1+="\[\e[m\] "
}
