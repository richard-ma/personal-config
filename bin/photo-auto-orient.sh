#!/usr/bin/env bash

filename-lower.sh

for f in *.jpg; do
    convert -auto-orient "$f" "$f"
done
