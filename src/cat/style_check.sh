#!/bin/bash

echo "Cat check..."
cp materials/linters/.clang-format src/cat
cd src/cat

if ! (clang-format -Werror -n *.c *.h); then
  echo -e "\033[31mCode Style Cat - NO! ^(\033[0m" && exit 1
else
  echo -e "\033[38;5;4mCode Style Cat - OK! ^_^\033[0m"
fi

rm .clang-format
