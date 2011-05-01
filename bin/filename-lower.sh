#!/usr/bin/env bash

suffix=$1

for f in *$suffix; do
    mv $f `echo $f | tr "[A-Z]" "[a-z]"`
done
