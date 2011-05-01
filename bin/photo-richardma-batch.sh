#!/usr/bin/env bash

filename-lower.sh .JPG

for f in *.jpg; do
    photo-richardma.sh $f $f
done
