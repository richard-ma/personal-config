# Load tmux
#[[ "$TMUX" == "" ]] && exec tmux

# Path to your oh-my-zsh configuration.
ZSH=$HOME/Personal/config/zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="richardma"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn)

source $ZSH/oh-my-zsh.sh

################################################################################
# Richard Ma's zsh configuration
################################################################################

# Exports
export EDITOR=vim

if [ -e ~/bin ]; then
    export PATH=$PATH:~/bin/
fi

if [[ -n ${INSIDE_EMACS} ]]; then
    # This shell runs inside an Emacs *shell*
    unsetopt zle
fi

# dh_make
export DEBEMAIL="richard.ma.19850509@gmail.com"
export DEBFULLNAME="Richard Ma"

# user env vars
export USER_CONFIG_DIR=~/Personal/config
export USER_WIKI_DIR=~/Personal/wiki

# tmux
export TERM=xterm-256color
# tmuxifier
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmuxifier-layouts"
[[ -s "$HOME/.tmuxifier/init.sh" ]] && source "$HOME/.tmuxifier/init.sh"

#heroku
export PATH=$PATH:/usr/local/heroku/bin

#aliases
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases" 

#functions
[[ -s "$HOME/.functions" ]] && source "$HOME/.functions" 

# rvm
source ~/.profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# opencv
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
