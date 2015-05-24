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
export GEM_HOME=~/.gems
export RAILS_ENV=production
export RAILS_LOAD_ALL_LOCALES=true
PATH=$PATH:$HOME/.bin:$HOME/.gem/ruby/2.1.0/bin:$GEM_HOME/bin

export WORKON_HOME="$HOME/.virtualenvs"
source /usr/bin/virtualenvwrapper.sh
source /usr/local/rvm/scripts/rvm

# . "${ZDOTDIR:-$HOME}/.powerline/powerline/bindings/zsh/powerline.zsh"
powerline-daemon -q
. "/usr/share/powerline/zsh/powerline.zsh"

# Git Flow Auto-completion
source ~/.git-flow-completion/git-flow-completion.zsh

autoload -U zsh-mime-setup
zsh-mime-setup

alias pacman="sudo pacman"
alias yum="sudo dnf"
alias dnf="sudo dnf"
alias apt="sudo apt-get"
alias systemctl="sudo systemctl"
alias homegit="git --work-tree=$HOME --git-dir=$HOME/.dotfiles.git"
alias tmux="tmux -2"
alias vim="gvim -v"
alias c="clear"
alias -s php="vim"
alias -s html="vim"
alias -s css="vim"
