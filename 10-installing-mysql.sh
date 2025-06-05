#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please run the script with using root access"
else 
    echo "you are running with the root access"
fi
    dnf install mysql -y