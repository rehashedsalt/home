#!/usr/bin/env bash
git clone --recursive --separate-git-dir="$HOME/.dotfiles" git@github.com:rehashedsalt/home.git /tmp/dots
rsync -rvl --exclude ".git" /tmp/dots/ $HOME/
rm -r /tmp/dots
git submodule update --init --recursive --git-dir="$HOME/.dotfiles" --work-tree="$HOME" $HOME/
