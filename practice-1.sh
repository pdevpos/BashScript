#!/bin/bash
USERID=$(id -u)
check_root(){
  if [ $USERID -ne 0 ]; then
    echo "execute script in root privileges:: $USERID"

  fi
}
check_root