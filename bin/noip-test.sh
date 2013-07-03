#!/usr/bin/env bash

DIR=`pwd`
BIN_FILE=$DIR/$1
DATA_DIR=$DIR/$2
DEBUG=$3 

total_cnt=0
ac_cnt=0

for input_file in $(ls $DATA_DIR/*.in); do
    total_cnt=$(expr $total_cnt + 1)

    # Get standard output from data directory.
    test_file_basename=$(basename $input_file .in)
    standard_output_file=$DATA_DIR/$test_file_basename.out

    # Run the program for user output file.
    user_output_file=$DATA_DIR/user.out
    $BIN_FILE < $input_file > $user_output_file

    # Compire the user output file and standard output file.
    diff --strip-trailing-cr $user_output_file $standard_output_file > /dev/null

    if [ $? -eq 0 ]; then
        ac_cnt=$(expr $ac_cnt + 1)
        if [[ ! -z $DEBUG ]]; then
            echo "AC: $test_file_basename"
        fi
    else
        echo "WA: $test_file_basename"
    fi
done

# Remove user output file.
rm $user_output_file

# Make counting.
if [[ ! -z $DEBUG ]]; then
    echo "[$(echo "scale=2; ($ac_cnt / $total_cnt) * 100" | bc)%] Total: $total_cnt [AC: $ac_cnt | WA: $(expr $total_cnt - $ac_cnt)]"
fi
