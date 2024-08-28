#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
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
    echo -e "nginx installed $R failure.check it..."
  else
    echo -e "nginx installed $G success $N."

  fi
else
  echo "nginx is installed already...."
fi
