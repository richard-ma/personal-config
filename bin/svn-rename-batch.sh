#!/usr/bin/env bash

orig=$1
dest=$2

for f in *$orig; do
    svn mv $f ${f%\.*}.$dest
done
