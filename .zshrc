export PATH=$HOME/.bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH=/home/salt/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="theunraveler"

#CASE_SENSITIVE="true"
#HYPHEN_INSENSITIVE="true"
#DISABLE_AUTO_UPDATE="true"
#export UPDATE_ZSH_DAYS=13
#DISABLE_LS_COLORS="true"
#DISABLE_AUTO_TITLE="true"
#ENABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="true"
#DISABLE_UNTRACKED_FILES_DIRTY="true"
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
#HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
#ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

POWERLEVEL9K_DIR_HOME_FOREGROUND='0'
POWERLEVEL9K_DIR_HOME_BACKGROUND='13'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='0'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='5'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='0'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='5'

POWERLEVEL9K_DIR_WRITABLE_FOREGROUND='13'
POWERLEVEL9K_DIR_WRITABLE_BACKGROUND='0'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir dir_writable root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs vi_mode)

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd correctall extendedglob nomatch
unsetopt beep notify
bindkey -v
zstyle :compinstall filename '/home/salt/.zshrc'

autoload -Uz compinit
compinit

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
	alias e-depclean='sudo emerge -a --depclean'
fi
## neofetch
if [[ "$(which neofetch)" ]]; then
	alias fetch='neofetch --disable model resolution --block_range 0 15 --image wall --xoffset 4 --yoffset 4 --scrot ~/Pictures/neofetch.png'
	alias fetch-up='neofetch --disable model resolution --block_range 0 15 --image wall --xoffset 4 --yoffset 4 --upload --image_host imgur'
fi

source $ZSH/oh-my-zsh.sh
