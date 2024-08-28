#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
logfile="/var/log/shell-script"
check_root(){
  if [ $USERID -ne 0 ]; then
    echo "execute script in root privileges:: $USERID"
    exit 1
  fi
}
validate()
{
  if [ $1 -ne 0 ]; then
    echo -e "$2  not installed properly its $R failure.check it..." &>>logfile
  else
    echo -e "$2 installed $G success $N." &>>logfile
  fi
}
check_root

for package in $@
do
  dnf list installed $package
  if [ $? -ne 0 ]
  then
    echo "$package not installed please install...." &>>logfile
    dnf install $package -y
    validate $? "package"
  else
    echo -e "$Y $package is installed already....$N" &>>logfile
  fi
done
