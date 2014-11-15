#!/bin/bash
file_dir="/import/391232/testimport"

file_count=10000
size=5000
processes=100

for (( i=0; i < file_count ; i++ )); do
    /usr/bin/printf "%s\0" if=/dev/zero of="$file_dir"/${RANDOM}.txt bs=512 count="$size"
done  | xargs -0 -n4 -P"$processes" /bin/dd

