#!/usr/bin/env bash

source_file=$1
target_file=$source_file'_'

convert \
    -bordercolor black \
    -border 15x15 \
    -bordercolor white \
    -border 10x10 \
    $source_file \
    $target_file
