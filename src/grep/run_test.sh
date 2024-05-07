#!/bin/bash

SUCCESS=0
FAIL=0
COUNT=0
ALL=0
DIFF=""
TEST_FILE_1="s21_greptest1.txt"
TEST_FILE_2="s21_greptest1.txt s21_greptest2.txt"
TEST_FILE_F1="F_1.txt"
TEST_FILE_F2="F_1.txt -f F_2.txt"
echo "" > log.txt


for var in -i -v -c -n -h -s 
do
    for file in $TEST_FILE_1  "$TEST_FILE_2"
    do
        (( COUNT++ ))
        TEST1="-e lop -e 43 $var $file"
         # echo "$COUNT. $TEST1" 
          ./s21_grep $TEST1 > s21_grep.txt
          grep $TEST1 > grep.txt
          DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
          if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
            then
               # echo "SUCCESS"
                (( SUCCESS++ ))
            else
               # echo "FAIL"
                echo "$TEST1" >> log.txt
                (( FAIL++ ))
          fi
          rm s21_grep.txt grep.txt
    done
done

for var1 in -i -v -c -n -h -s
do
    for var2 in -i -v -c -n -h -s
    do
        for file in $TEST_FILE_1  "$TEST_FILE_2"
        do
            if [ $var1 != $var2 ]
            then
            (( COUNT++ ))
            TEST1="-e lop -e 43 $var1 $var2 $file"
           # echo "$COUNT. $TEST1"
            ./s21_grep $TEST1 > s21_grep.txt
            grep $TEST1 > grep.txt
            DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
                if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
                    then
                   # echo "SUCCESS"
                    (( SUCCESS++ ))
                    else
                    echo "$TEST1" >> log.txt
                   # echo "FAIL"
                    (( FAIL++ ))
                fi
            rm s21_grep.txt grep.txt
            fi
        done
    done
done


for var1 in -i -v -c -n -h -s
do
    for var2 in -i -v -c -n -h -s
    do
        for file in $TEST_FILE_1  "$TEST_FILE_2"
        do
            if [ $var1 != $var2 ]
            then
            (( COUNT++ ))
            TEST1="-e lop -e 43 $var1 $var2 $file"
           # echo "$COUNT. $TEST1"
            ./s21_grep $TEST1 > s21_grep.txt
            grep $TEST1 > grep.txt
            DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
                if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
                    then
                   # echo "SUCCESS"
                    (( SUCCESS++ ))
                    else
                    echo "$TEST1" >> log.txt
                   # echo "FAIL"
                    (( FAIL++ ))
                fi
            rm s21_grep.txt grep.txt
            fi
        done
    done
done


for var1 in -i -v -c -n -h -s
do
    for var2 in -i -v -c -n -h -s
    do
        for var3 in -i -v -c -n -h -s
        do
            for file in $TEST_FILE_1  "$TEST_FILE_2"
            do
                if [ "$var1" != "$var2" ] && [ "$var1" != "$var3" ] && [ "$var2" != "$var3" ]
                then
                (( COUNT++ ))
                TEST1="-e lop -e 43 $var1 $var2 $var3 $file"
               # echo "$COUNT. $TEST1"
                ./s21_grep $TEST1 > s21_grep.txt
                grep $TEST1 > grep.txt
                DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
                    if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
                        then
                       # echo "SUCCESS"
                        (( SUCCESS++ ))
                        else
                       # echo "FAIL"
                        echo "$TEST1" >> log.txt
                        (( FAIL++ ))
                    fi
                rm s21_grep.txt grep.txt
                fi
            done
        done
    done
done


for var1 in -i -v -c -n -h -s 
do
    for var2 in -i -v -c -n -h -s 
    do
        for var3 in -i -v -c -n -h -s 
        do
            for file in $TEST_FILE_1  "$TEST_FILE_2"
            do
                for f_file in $TEST_FILE_F1  "$TEST_FILE_F2"
                do 
                    if [ "$var1" != "$var2" ] && [ "$var1" != "$var3" ] && [ "$var2" != "$var3" ]
                    then
                    (( COUNT++ ))
                    TEST1="-e lop -e 43 -f $f_file $var1 $var2 $var3 $file"
                   # echo "$COUNT. $TEST1"
                    ./s21_grep $TEST1 > s21_grep.txt
                    grep $TEST1 > grep.txt
                    DIFF_RES="$(diff -s s21_grep.txt grep.txt)"
                        if [ "$DIFF_RES" == "Files s21_grep.txt and grep.txt are identical" ]
                            then
                           # echo "SUCCESS"
                            (( SUCCESS++ ))
                            else
                           # echo "FAIL"
                            echo "$TEST1" >> log.txt
                            (( FAIL++ ))
                        fi
                    rm s21_grep.txt grep.txt
                    fi
                done    
            done
        done
    done
done



echo "SUCCESS: $SUCCESS"
echo "FAIL: $FAIL"
if [[ $FAIL -gt 0 ]]; then
  echo -e "\033[31mTest Grep - NO! :(\033[0m" && exit 1
else
  echo -e "\033[38;5;4mTest Grep - OK! ^_^\033[0m"
fi
exit $FAIL
