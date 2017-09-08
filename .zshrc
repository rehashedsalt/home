if [[ -f "/etc/profile" ]]; then
	source /etc/profile 2>& /dev/null
fi
export ZSH=/home/salt/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="theunraveler"

#CASE_SENSITIVE="true"
#HYPHEN_INSENSITIVE="true"
#DISABLE_AUTO_UPDATE="true"
#export UPDATE_ZSH_DAYS=13
#DISABLE_AUTO_TITLE="true"
#ENABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="true"
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

POWERLEVEL9K_DIR_HOME_FOREGROUND='0'
POWERLEVEL9K_DIR_HOME_BACKGROUND='12'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='0'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='4'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='0'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='4'

#POWERLEVEL9K_DIR_WRITABLE_FOREGROUND='13'
#POWERLEVEL9K_DIR_WRITABLE_BACKGROUND='0'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir dir_writable status root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs)

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory autocd correctall extendedglob nomatch
unsetopt beep notify
bindkey -v
zstyle :compinstall filename '/home/salt/.zshrc'
autoload -Uz compinit
compinit

source $ZSH/oh-my-zsh.sh

if [[ -f "$HOME/.profile" ]]; then
	source "$HOME/.profile" 2>& /dev/null
fi
