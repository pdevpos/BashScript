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
Install_package()
{
  if [ $1 -ne 0 ]; then
    echo "$2 not installed...$3"
    dnf install nginx -y
    validate $? "$2 installed"

  else
    echo "nginx already installed"
  fi
}

dnf list installed nginx
Install_package $? "nginx" "please install"


