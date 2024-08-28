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
    echo -e "$2  not installed properly its $R failure.check it..."
  else
    echo -e "$2 installed $G success $N."

  fi
}
check_root
for package in $@
do
  if [ $? -ne 0 ]
  then
    echo "$package not installed please install...."
    dnf install $package -y
    validate $? "package"
  else
    echo -e "$Y $package is installed already....$N"
  fi
done
