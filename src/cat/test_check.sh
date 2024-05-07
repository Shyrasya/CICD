#!/bin/bash

echo "Cat Test Start..."
cd src/cat
FILE=$"./run_test.sh"
chmod +x $FILE

if ! [[ $FILE -eq 0 ]]; then
  echo -e "\033[31mTest Cat - NO! :(\033[0m" && exit 1
else
  echo -e "\033[38;5;4mTest Cat - OK! ^_^\033[0m"
fi
