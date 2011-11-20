#!/usr/bin/env bash

filename-lower.sh .JPG

for f in *.jpg; do
    photo-tjlug.sh $f $f
done
