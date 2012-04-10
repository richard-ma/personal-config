#!/usr/bin/env bash
set -o errexit

infile="$1"
outfile="$2"

test -z "$1" && exit 1
test -z "$2" && outfile="$1.gbk"

iconv -f "utf-8" -t "gbk" "$infile" > "$outfile"
