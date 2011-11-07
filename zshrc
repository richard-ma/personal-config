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
autoload -U colors && colors
autoload zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval MY_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval MY_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
MY_NO_COLOUR="%{$terminfo[sgr0]%}"

MY_SET_CHARSET="%{$terminfo[enacs]%}"
MY_SHIFT_IN="%{$terminfo[smacs]%}"
MY_SHIFT_OUT="%{$terminfo[rmacs]%}"
MY_HBAR=${altchar[q]:--}
MY_LVBAR=${altchar[t]:--}
MY_RVBAR=${altchar[u]:--}

MY_ULCORNER=${altchar[l]:--}
MY_LLCORNER=${altchar[m]:--}
MY_LRCORNER=${altchar[j]:--}
MY_URCORNER=${altchar[k]:--}

PROMPT='(%n@%M:%l)
(%~)
>>%#'

RPROMPT='(%D{%a, %b%d %H:%M})'

# 彩色命令
TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')

recolor-cmd() {
    region_highlight=()
    colorize=true
    start_pos=0
    for arg in ${(z)BUFFER}; do
        ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
        ((end_pos=$start_pos+${#arg}))
        if $colorize; then
            colorize=false
            res=$(LC_ALL=C builtin type $arg 2>/dev/null)
            case $res in
                *'reserved word'*)   style="fg=magenta,bold";;
                *'alias for'*)       style="fg=cyan,bold";;
                *'shell builtin'*)   style="fg=yellow,bold";;
                *'shell function'*)  style='fg=green,bold';;
                *"$arg is"*)         
                    [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
                *)                   style='none,bold';;
            esac
            region_highlight+=("$start_pos $end_pos $style")
        fi
        [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
        start_pos=$end_pos
    done
}
check-cmd-self-insert() { zle .self-insert && recolor-cmd }
check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }

zle -N self-insert check-cmd-self-insert
zle -N backward-delete-char check-cmd-backward-delete-char

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
