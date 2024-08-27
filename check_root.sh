#!/bin/bash
#id
#userid=$(id)
#echo "user id: $userid"
userid=$(id -u)
if [ $userid -ne 0 ];
then
  echo "please run the script with root privileges : $userid"
fi
dnf install nginx -y
