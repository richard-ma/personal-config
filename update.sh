#!/usr/bin/env bash

function do_update()
{
    source_file=$1
    link_file=$2
    echo "================================================="
    echo "Start    Update: \"$source_file -> $link_file\""

    if [ -e $link_file ]; then
        echo ">>Delete old file(s): \"$link_file\""
        echo $link_file
        rm $link_file
    fi

    ln -s $source_file $link_file

    echo "Complete Update: \"$source_file -> $link_file\""
    echo 
}

source_file="$PWD/bashrc"
target_file="$HOME/.bashrc"
do_update $source_file $target_file
source $target_file

source_file="$PWD/vimrc"
target_file="$HOME/.vimrc"
do_update $source_file $target_file

source_file="$PWD/vim"
target_file="$HOME/.vim"
do_update $source_file $target_file

source_file="$PWD/gitconfig"
target_file="$HOME/.gitconfig"
do_update $source_file $target_file

source_file="$PWD/dput.cf"
target_file="$HOME/.dput.cf"
do_update $source_file $target_file

