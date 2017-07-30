set fish_greeting ""

function fish_prompt
	~/.bin/powerline-shell.py $status --shell bare ^/dev/null
end

export PATH="$PATH:$HOME/.bin:$HOME/.local/bin"
export TERM="xterm-256color"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
