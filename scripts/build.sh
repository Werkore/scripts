#! /bin/bash

if [ -z "$1" ]; then
echo "Usage: $0 <source_file>"
exit 1
fi

source_file="$1"
file_name=$(basename "$source_file" .c)
executable_name="$file_name"

gcc "$source_file" -Wall -Werror -std=c11 -g -o "$executable_name"

if [ $? -eq 0 ]; then
echo "compilation successful"
else
echo "compilation failed"
exit 1
fi

