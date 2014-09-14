#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Custom HOME Path
PATH=$PATH:$HOME/bin

autoload -U zsh-mime-setup
zsh-mime-setup

alias pacman="sudo pacman";
alias systemctl="sudo systemctl";
alias homegit="git --work-tree=$HOME --git-dir=$HOME/.dotfiles.git"
alias -s php="vim";
alias -s html="vim";
alias -s css="vim";
