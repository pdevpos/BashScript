#!/bin/bash
#id
#userid=$(id)
#echo "user id: $userid"
userid=$(id -u)
if [ $userid -ne 0 ];
then
  echo "please run the script with root privileges : $userid"
  exit 1
fi
dnf list installed nginx

