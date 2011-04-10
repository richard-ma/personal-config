#!/usr/bin/env bash

readonly sourcefile=$1
readonly targetfile=$2

#######################################
# Main
convert \
    -resize 800x600! \
    -auto-orient \
    $sourcefile\
    tmp1.ptmp

composite \
    -gravity SouthEast \
    -geometry +30+30 \
    $USER_CONFIG_DIR/images/PhotoLogo.png \
    tmp1.ptmp\
    tmp2.ptmp

convert \
    -bordercolor black \
    -border 15 \
    -bordercolor white \
    -border 20x15 \
    tmp2.ptmp \
    $targetfile

rm *.ptmp

exit 0
