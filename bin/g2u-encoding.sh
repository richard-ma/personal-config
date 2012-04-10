#!/usr/bin/env bash
set -o errexit

infile="$1"
outfile="$2"

test -z "$1" && exit 1
test -z "$2" && outfile="$1.utf8"

iconv -f "gbk" -t "utf-8" "$infile" > "$outfile"
