#!/bin/bash


echo "All variables pass at once: $@"

echo "Number of variables: $#"

echo "Present workind directory $PWD"

echo "PID of the script $$"
sleep 10 &

echo "script name $0"

echo "User running in this script $USER"

echo "Home directory of the user $HOME"

echo "PID of the last command in backround $!"