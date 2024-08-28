#!/bin/bash
USERID=$(id -u)
check_root(){
  if [ $USERID -ne 0 ]; then
    echo "execute script in root privileges:: $USERID"
    exit 1
  fi
}
check_root
dnf list installed nginx
if [ $? -ne 0 ]
then
  echo "nginx not installed please install...."
  dnf install nginx -y
  if [ $? -ne 0 ]; then
    echo "nginx installed failure.check it..."
  else
    echo "nginx installed success."

  fi
else
  echo "nginx is installed already...."
fi
