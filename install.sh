#!/bin/bash

echo "Welcome to Anass dotFiles Initialization"

# Git Repo of our Dot Files
GIT_REPO="git@github.com:anassahmed/dotfiles.git"

# Home Git command to download to the home directory
HOMEGIT="git --work-tree=~/ --git-dir=~/.dotfiles.git"

GIT_V=`git --version`
if [ $? -ne 0 ]
then
    echo "Git should be installed before proceeding. please install it and try again"
    exit
fi

# Initialize Git repo in the home directory
`$HOMEGIT` init

# Add our repo
`$HOMEGIT` remote add origin $GIT_REPO

# Pull the contents
`$HOMEGIT` pull -u origin master

# Pull the submodules
`$HOMEGIT` submodules update --init --recursive

# Install VIM Plugins
vim +PluginInstall +qall

# Compile VIM YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.sh
cd ~

# Change shell ot ZSH
chsh -s /bin/zsh

echo "Installation completed successfully."
