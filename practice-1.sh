#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
check_root(){
  if [ $USERID -ne 0 ]; then
    echo "execute script in root privileges:: $USERID"
    exit 1
  fi
}
validate()
{
  if [ $1 -ne 0 ]; then
    echo -e "nginx  not installed properly its $R failure.check it..."
  else
    echo -e "nginx installed $G success $N."

  fi
}
check_root
dnf list installed nginx
if [ $? -ne 0 ]
then
  echo "nginx not installed please install...."
  dnf install nginx -y
#  if [ $? -ne 0 ]; then
#    echo -e "nginx installed $R failure.check it..."
#  else
#    echo -e "nginx installed $G success $N."
#
#  fi
   validate $?
else
  echo -e "$Y nginx is installed already...."
fi

