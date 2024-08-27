#!/bin/bash
number=$1
if [ $number -gt 30 ];
then
    echo "Given number $number is greater than 30"
else
  echo "Given number $number is less than 30"
fi
