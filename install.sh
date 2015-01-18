#!/bin/bash

echo "Welcome to Anass dotFiles Initialization"

DEBENDENCIES="git vim zsh cmake ctags"
DEB_DEBENDENCIES="python-dev"
RED_DEBENDENCIES="python-devel"

echo "Installing Debendencies..."
if [ -f /etc/lsb-release ]; then
    OS=`lsb_release -si`
    if [ "$OS" == "Arch" ]; then
        yes | sudo pacman -S $DEBENDENCIES
    elif [ "$OS" == "Fedora" ]; then
        sudo yum install -y $DEBENDENCIES $RED_DEBENDENCIES
    elif [ "$OS" == "Ubuntu" ]; then
        sudo apt-get install -y $DEBENDENCIES $DEB_DEBENDENCIES
    fi
elif [ -f /etc/debian_version ]; then
    sudo apt-get install -y $DEBENDENCIES $DEB_DEBENDENCIES
elif [ -f /etc/redhat-release ]; then
    sudo yum install -y $DEBENDENCIES $RED_DEBENDENCIES
else
    echo "Failed to detect your distro."
    echo "Please Install these dependencies: $DEBENDENCIES $DEB_DEBENDENCIES"
    exit
fi

# Git Repo of our Dot Files
GIT_REPO="https://github.com/anassahmed/dotfiles.git"

# Home Git command to download to the home directory
HOMEGIT="git --work-tree=$HOME --git-dir=$HOME/.dotfiles.git"

GIT_V=`git --version`
if [ $? -ne 0 ]
then
    echo "Git should be installed before proceeding. please install it and try again"
    exit
fi

# Initialize Git repo in the home directory
$HOMEGIT init

# Add our repo
$HOMEGIT remote add origin $GIT_REPO

# Pull the contents
$HOMEGIT pull -u origin master

# Pull the submodules
$HOMEGIT submodule update --init --recursive

# Install VIM Plugins
vim +PluginInstall +qall

# Compile VIM YouCompleteMe
cd $HOME/.vim/bundle/YouCompleteMe
./install.sh
cd $HOME

# Change shell ot ZSH
chsh -s /bin/zsh

echo "Installation completed successfully."
