#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please run the script with using root access"
    ecit 1 #give other than 0 upto to 127
else 
    echo "you are running with the root access"
fi
    dnf install mysql -y