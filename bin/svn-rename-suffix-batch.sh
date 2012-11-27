#!/usr/bin/env bash

orig=$1
dest=$2

if [ -z "$orig" ]; then orig="ans"; fi
if [ -z "$dest" ]; then dest="out"; fi

for f in *$orig; do
    svn mv $f ${f%\.*}.$dest
done

echo "$orig --> $dest"
