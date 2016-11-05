#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
if [[ $TERMINIX_ID ]]; then
        source /etc/profile.d/vte.sh
fi

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

DEFAULT_USER=anass

# . "${ZDOTDIR:-$HOME}/.powerline/powerline/bindings/zsh/powerline.zsh"
# powerline-daemon -q
# . "/usr/share/powerline/zsh/powerline.zsh"

# Git Flow Auto-completion
source ~/.git-flow-completion/git-flow-completion.zsh

autoload -U zsh-mime-setup
zsh-mime-setup

export EDITOR='vim'
export VISUAL=$EDITOR

alias pacman="sudo pacman"
alias yum="sudo dnf"
alias dnf="sudo dnf"
alias apt="sudo apt"
alias systemctl="sudo systemctl"
alias homegit="git --work-tree=$HOME --git-dir=$HOME/.dotfiles.git"
alias tmux="tmux -2"
alias vim="gvim -v"
alias odoo="/home/anass/Documents/workspace/odoo/odoo8/odoo.py"
alias c="clear"
alias -s php="vim"
alias -s html="vim"
alias -s css="vim"

function moon() {
    tarihi1=`date +%Y%m%d`;
    gcal -f/dev/null -"#0*d1#999_%Z__%O" %$tarihi1 -x --moon=8
}

POWERLEVEL9K_INSTALLATION_PATH=~/.powerlevel9k/
source ~/.powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs background_jobs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ram todo)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_RAM_ELEMENTS="ram_free"
# Colors
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="240"
POWERLEVEL9K_DIR_HOME_BACKGROUND="240"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="240"
POWERLEVEL9K_VIRTUALENV_FOREGROUND="white"
POWERLEVEL9K_VIRTUALENV_BACKGROUND="245"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="white"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="034"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="white"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="124"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="white"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="214"
POWERLEVEL9K_STATUS_OK_FOREGROUND="white"
POWERLEVEL9K_STATUS_OK_BACKGROUND="078"
POWERLEVEL9K_RAM_FOREGROUND="white"
POWERLEVEL9K_RAM_BACKGROUND="208"
