#!/usr/bin/env bash

name=$1

datagen=./datagen
correct=./correct
count=10

if [[ ! -e $correct ]]; then
    echo "\"$correct\" NOT Found."
    exit 1
fi

if [[ ! -e $datagen ]]; then
    echo "\"$datagen\" NOT Found."
    exit 1
fi

if [[ -e $name ]]; then
    echo "\"$name\" ALREADY Exsists."
    exit 2
else
    mkdir -p $name/linux
    mkdir -p $name/windows
fi

for ((i=0; i<$count; i++))
do
    $datagen > $name/linux/$name$i.in
    cp $name/linux/$name$i.in $name/windows/$name$i.in

    $correct < $name/linux/$name$i.in > $name/linux/$name$i.out
    cp $name/linux/$name$i.out $name/windows/$name$i.out

# get a new random seed for c stdlib
    sleep 1
done

# replace \n to \r\n for Windows.
sed -i -e 's/$/\r/' $name/windows/*.in $name/windows/*.out

