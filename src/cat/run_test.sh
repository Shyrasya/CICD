#!/bin/bash

SUCCESS=0
FAIL=0
COUNT=0
DIFF=""
FILE="file.txt"
echo "" > log.txt

for flag in -b -e -n -s -t -v
do
    (( COUNT++ ))
    TEST_1="$flag $FILE"
   # echo "$COUNT. $TEST_1"
    ./s21_cat $TEST_1 > s_21_cat.txt
    cat $TEST_1 > orig_cat.txt
    DIFF="$(diff -s s_21_cat.txt orig_cat.txt)"
    if  [ "$DIFF" == "Files s_21_cat.txt and orig_cat.txt are identical" ]
        then
            (( SUCCESS++ ))
        else
            echo "$TEST_1" >> log.txt
            (( FAIL++))
    fi
    rm s_21_cat.txt orig_cat.txt
done

for flag in -b -e -n -s -t -v
do
  for flag2 in -b -e -n -s -t -v
  do
        if [ $flag != $flag2 ]
        then
          (( COUNT++ ))
          TEST_1="$flag $flag2 $FILE"
         # echo "$COUNT. $TEST_1"
          ./s21_cat $TEST_1 > s_21_cat.txt
          cat $TEST_1 > orig_cat.txt
          DIFF="$(diff -s s_21_cat.txt orig_cat.txt)"
          if [ "$DIFF" == "Files s_21_cat.txt and orig_cat.txt are identical" ]
            then
              (( SUCCESS++ ))
            else
              echo "$TEST_1" >> log.txt
              (( FAIL++ ))
          fi
          rm s_21_cat.txt orig_cat.txt
        fi
  done
done

for flag in -b -e -n -s -t -v
do
  for flag2 in -b -e -n -s -t -v
  do
      for flag3 in -b -e -n -s -t -v
      do
        if [ $flag != $flag2 ] && [ $flag2 != $flag3 ] && [ $flag != $flag3 ]
        then
          (( COUNT++ ))
          TEST_1="$flag $flag2 $flag3 $FILE"
         # echo "$COUNT. $TEST_1"
          ./s21_cat $TEST_1 > s_21_cat.txt
          cat $TEST_1 > orig_cat.txt
          DIFF="$(diff -s s_21_cat.txt orig_cat.txt)"
          if [ "$DIFF" == "Files s_21_cat.txt and orig_cat.txt are identical" ]
            then
              (( SUCCESS++ ))
            else
              echo "$TEST_1" >> log.txt
              (( FAIL++ ))
          fi
          rm s_21_cat.txt orig_cat.txt

        fi
      done
  done
done

for flag in -b -e -n -s -t -v
do
  for flag2 in -b -e -n -s -t -v
  do
      for flag3 in -b -e -n -s -t -v 
      do
          for flag4 in -b -e -n -s -t -v
          do
            if [ $flag != $flag2 ] && [ $flag2 != $flag3 ] && [ $flag != $flag3 ] && [ $flag != $flag4 ] && [ $flag2 != $flag4 ] && [ $flag3 != $flag4 ]
            then
              (( COUNT++ ))
              TEST_1="$flag $flag2 $flag3 $flag4 $FILE"
             # echo "$COUNT. $TEST_1"
              ./s21_cat $TEST_1 > s_21_cat.txt
              cat $TEST_1 > orig_cat.txt
              DIFF="$(diff -s s_21_cat.txt orig_cat.txt)"
              if [ "$DIFF" == "Files s_21_cat.txt and orig_cat.txt are identical" ]
                then
                  (( SUCCESS++ ))
                else
                  echo "$TEST_1" >> log.txt
                  (( FAIL++ ))
              fi
              rm s_21_cat.txt orig_cat.txt

            fi
          done
      done
  done
done

echo "SUCCESS: $SUCCESS"
echo "FAIL: $FAIL"
if [[ $FAIL -gt 0 ]]; then
  echo -e "\033[31mTest Cat - NO! :(\033[0m" && exit 1
else
  echo -e "\033[38;5;4mTest Cat - OK! ^_^\033[0m"
fi
exit $FAIL
