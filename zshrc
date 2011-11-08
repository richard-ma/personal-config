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
plugins=(git svn vi-mode)

source $ZSH/oh-my-zsh.sh

################################################################################
# Richard Ma's zsh configuration
################################################################################

# 路径别名
#hash -d fhlnoip="/home/richardma/Projects/fhlnoip"
#hash -d config="/home/richardma/Personal/config"
#hash -d wiki="/home/richardma/Personal/wiki"

# Exports
export EDITOR=vim

if [ -f ~/bin ]; then
    export PATH=$PATH:~/bin/
fi

# dh_make
export DEBEMAIL="richard.ma.19850509@gmail.com"
export DEBFULLNAME="Richard Ma"

# user env vars
export USER_CONFIG_DIR=~/Personal/config
export USER_WIKI_DIR=~/Personal/wiki
