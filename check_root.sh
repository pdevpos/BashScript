#!/bin/bash
id
userid=$(id)
echo "user id: $userid"
if [ $userid -ne 0 ];
then
  echo "please run the script with root priviliges"
fi
dnf install nginx -y
