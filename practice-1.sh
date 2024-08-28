#!/bin/bash
USERID=$(id -u)
check_root(){
  if [ $1 -ne 0 ]; then
    echo "execute script in root privileges $USERID"

  fi
}
check_root $?