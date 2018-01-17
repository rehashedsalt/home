#!/usr/bin/env bash
tempfolder="/tmp/dots$(uuidgen)"
git clone --recursive --separate-git-dir="$HOME/.dotfiles" https://github.com/rehashedsalt/home.git $tempfolder
rsync -rvl --exclude ".git" $tempfolder/ $HOME/
rm -r $tempfolder
git submodule update --init --recursive --git-dir="$HOME/.dotfiles" --work-tree="$HOME" $HOME/
