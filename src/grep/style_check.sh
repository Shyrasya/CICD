#!/bin/bash

echo "Grep check..."
cp materials/linters/.clang-format src/grep
cd src/grep

if !(clang-format -Werror -n *.c *.h); then
  echo -e "\033[31mCode Style Grep - NO! :(\033[0m" && exit 1
else
  echo -e "\033[38;5;4mCode Style Grep - OK! ^_^\033[0m"
fi

rm .clang-format
