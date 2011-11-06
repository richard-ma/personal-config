# 历史纪录
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# 按键风格
bindkey -v

# 自动补全
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -U compinit
compinit

# 命令纠错
setopt correctall

# 命令提示符
autoload -U promptinit
promptinit

# autocd
setopt autocd

# 扩展文件名替换
setopt extendedglob

# 命令别名
alias ls='ls --color=always'
alias ll='ls -lh'
alias la='ls -A'
alias lal='ls -Alh'
alias l='ls -CF'
alias grep='grep --color=always'

# 路径别名
hash -d fhlnoip="~/Projects/fhlnoip"
hash -d config="~/Personal/config"
hash -d wiki="~/Personal/wiki"

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
