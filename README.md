# Salt's Dotfiles
Just a repo of all my relevant dotfiles. Makes it easier to get set up on new machines, etc.

I am not a copyright holder for several of these materials. Unless otherwise specified, assume that any software you find here is not licensed to you in any capacity.

Unless, of course, it has a GPL or MIT header or something. Then, by all means, copy it.

## ~/.bin
A series of executables, several (but not all) of them written by me. One day I'll get around to writing up licenses for all of them.

## ~/.config
Application-specific configuration files. If you're looking for my rice, it's mostly in here.

## ~/.local
Right now it's just a bunch of Powerline fonts. Note, however, that several `shellrc`s here will access executables in the `~/.local/bin` directory.

## ~/.oh-my-zsh
A copy of the Oh-My-Zsh repo, plus whatever configuration files I've stuffed in there (should just be powerlevel9k).

## ~/.themes
A whole lot of GTK themes.

## ~/\*
### .Xdefaults
Any explanation for it is longer than it.

### .Xresources
Basic themeing file, holding whatever colorscheme I'm currently attatched to. Where possible, I try to reference it to centralize themeing.

### .bash\_profile
Currently does almost nothing because I never use `bash`.

### .profile
Shell-agnostic configuration. Should be POSIX-compliant.

### .xinitrc
I use a DM so this sees very little love. If I can figure out how to into environment variables, maybe this'll see more use.

### .xsessionrc
Don't look. Right now it's just me trying to hack together an environment.

### .zshrc
A simple `zsh` configuration file, as built to handle oh-my-zsh.
