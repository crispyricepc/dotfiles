#!/bin/bash

# File symlinks
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.p10k.zsh $HOME/.p10k.zsh
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig

# Dir symlinks
ln -s $HOME/dotfiles/bin $HOME/bin
ln -s $HOME/dotfiles/.zsh-plugins $HOME/.zsh-plugins
