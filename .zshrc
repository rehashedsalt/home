if [[ -f "/etc/profile" ]]; then
	source /etc/profile 2>& /dev/null
fi
export ZSH=/home/salt/.oh-my-zsh
export LANG="en_US.UTF-8"

#CASE_SENSITIVE="true"
#HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
#DISABLE_AUTO_TITLE="true"
#ENABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="true"
#DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_CUSTOM="$HOME/.omzcustom"
ZSH_THEME="salt"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

DEFAULT_USER=salt
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
zstyle :compinstall filename '/home/salt/.zshrc'
autoload -Uz compinit
compinit

source $ZSH/oh-my-zsh.sh

if [[ -f "$HOME/.profile" ]]; then
	source "$HOME/.profile" 2>& /dev/null
fi
