#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]; then
  echo "execute script in root privileges...$userid"
fi

validate()
{
  echo "exist status.. $1"
  if [ $1 -ne 0 ]; then
    echo "$2 failed"
    exit 1
  else
    echo "$2 success"

  fi
}

dnf list installed nginx
if [ $? -ne 0 ]; then
  echo "nginx not installed...please install"
  dnf install nginx -y
  validate $? "nginx installed"

else
  echo "nginx already installed"
fi

