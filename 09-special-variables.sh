#! /bin/bash

echo "All variables are passed to the sript: $@"
echo "All variables are passed to the sript: $*"
echo "Script name is: $0"
echo "Current directory is: $PWD"
echo "Who is running this: $USER"
echo "home directory of the user: $HOME"
echo "PID of this script: $$"
sleep 50 &
echo "PID of the last command in background is: $!"