#!/usr/bin/env bash

source_file=$1
target_file=$source_file

convert \
    -resize @480000 \
    $source_file \
    $target_file
