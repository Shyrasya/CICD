#!/bin/bash

USR="lemongrb"
DEST="/usr/local/bin/"
TMP_ART2="/tmp"
IP2="192.168.0.12"
NO_KEY="-o StrictHostKeyChecking=no"

echo -e "\033[95mStart copying Cat/Grep to wm2...\033[0m"
ssh $NO_KEY $USR@$IP2 "rm -f $DEST/s21_cat $DEST/s21_grep"
echo -e "\033[36mRemove old Cat/Grep\033[0m"

scp -p $NO_KEY src/cat/s21_cat src/grep/s21_grep $USR@$IP2:$DEST
if [ $? -ne 0 ]; then
  echo -e "\033[31mCopy Cat/Grep Error :(\033[0m" && exit 1
fi

echo -e "\033[95mCopy Cat and Grep done!\033[0m"

