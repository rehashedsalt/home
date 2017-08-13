# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/salt/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Append folders to PATH
export PATH="$PATH:$HOME/.bin:$HOME/.local/bin"

# Aliases
## ls
alias l='ls --color=auto --file-type'
alias la='ls -A --color=auto --file-type'
alias ls='ls --color=auto'
alias ll='ls -Ahl --color=auto --file-type'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
## emerge
if [[ "$(which emerge)" ]]; then
	alias e-sync='sudo emerge --sync'
	alias e-upgrade='sudo emerge -DNuva --with-bdeps=y @world'
	alias e-inst='sudo emerge -av'
fi
## neofetch
alias fetch='neofetch --disable model resolution --block_range 0 15 --image wall --xoffset 4 --yoffset 4'

# Powerline-Shell
function powerline_precmd() {
	PS1="$(~/.bin/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
	for s in "${precmd_functions[@]}"; do
		if [ "$s" = "powerline_precmd" ]; then
			return
		fi
	done
	precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
	install_powerline_precmd
fi
