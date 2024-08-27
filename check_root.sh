#!/bin/bash
#id
#userid=$(id)
#echo "user id: $userid"
userid=$(id -u)
if [ $userid -ne 0 ]
then
  echo "please run the script with root privileges : $userid"
  exit 1
fi

dnf list installed nginx
if [ $? -ne 0 ];
then
  echo "nginx not installed , please install"
  dnf install nginx -y
else
  echo "nginx already installed"
fi

