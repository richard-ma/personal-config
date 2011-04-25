#!/usr/bin/env bash

suffix=$1

for f in *$suffix; do
    mv $f `echo $f | tr "[a-z]" "[A-Z]"`
done
