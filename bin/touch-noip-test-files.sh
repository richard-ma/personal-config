#! /usr/bin/env bash

preffix=$1

for i in `seq 0 9`
do
    touch ${preffix}${i}.in
    touch ${preffix}${i}.out
done
