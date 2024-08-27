#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]; then
  echo "execute script in root privileges...$userid"
fi

validate()
{
  echo "exist status.. $1"
}
validate $?

