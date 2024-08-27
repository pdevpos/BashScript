#!/bin/bash
echo  "Get all the variables passed to the script: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "Current working directory: $PWD"
echo "Home directory: $HOME"
echo "current executing processor ID: $$"
echo "PID of last background command: $!"