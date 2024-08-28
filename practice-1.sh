#!/bin/bash
USERID=$(id -u)
check_root(){
  if [ $USERID -ne 0 ]; then
    echo "execute script in root privileges:: $USERID"

  fi
}
check_root
dnf list installed nginx
if [ $? -ne 0 ]
then
  echo "nginx not installed please install...."
  dnf install nginx
else
  echo "nginx is installed already...."
fi