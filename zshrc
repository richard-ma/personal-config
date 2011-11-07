# 历史纪录
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# 按键风格
bindkey -v

# 自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU
#开启此选项，补全时会直接选中菜单项
#setopt MENU_COMPLETE

autoload -U compinit
compinit

#自动补全缓存
#zstyle ':completion::complete:*' use-cache on
#zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#自动补全选项
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'

zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

#路径补全
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'
zstyle ':completion::complete:*' '\\'

#彩色补全菜单 
eval $(dircolors -b) 
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#修正大小写
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
#错误校正      
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

#kill 命令补全      
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

#补全类型提示分组 
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'

# cd ~ 补全顺序
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
#}}}

# 命令纠错
setopt correctall

# 命令提示符
autoload -U colors && colors
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval MY_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
MY_NO_COLOUR="%{$terminfo[sgr0]%}"

PROMPT="%(?.$MY_YELLOW.$MY_RED)>-------------------------------------------------------------------------------
$MY_CYAN>($MY_BLUE%n@%M$MY_WHITE:$MY_GREEN%l$MY_CYAN)-(${MY_RED}Jobs$MY_WHITE:$MY_YELLOW%j$MY_CYAN)
$MY_CYAN>($MY_YELLOW%~$MY_CYAN)
%(?.$MY_CYAN.$MY_RED)>>%# $MY_NO_COLOR"

RPROMPT="$MY_YELLOW(%D{%a, %b%d %H:%M})"

# autocd
#setopt autocd

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
