#! /bin/bash
print_red(){
echo -e "\033[1;31m$1\033[0m"
}

print_green(){
echo -e "\033[1;32m$1\033[0m"
}

if [ -z "$1" ]; then
echo "Usage: $0 <source_file>"
exit 1
fi

source_file="$1"
file_name=$(basename "$source_file" .c)
executable_name="$file_name"

gcc "$source_file" -Wall -Werror -fsanitize=address -std=c11 -g -o "$executable_name"

if [ $? -eq 0 ]; then
print_green "compilation successful"
else
print_red "compilation failed"
exit 1
fi

