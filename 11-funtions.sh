#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please run the script with using root access"
    exit 1 #give other than 0 upto to 127
else 
    echo "you are running with the root access"
fi

#vaildate functions takes input as exit status what command they tried to install
VALIDATE(){
if [ $1 -eq 0 ]
then
    echo "Installing $2 is... SUCCESS"
else
    echo "Installing $2 is... FAILURE"
    exit 1

fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "Mysql not installaed is going to be.. installed"
    dnf install mysql -y
    VALIDATE $? "Mysql"
else 
    echo "mysql is already installed.... Nothing to do"
fi 

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo "python3 not installaed is going to be.. installed"
    dnf install python3 -y
    VALIDATE $? "python3"
else 
    echo "python3 is already installed.... Nothing to do"
fi 

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo "nginx not installaed is going to be.. installed"
    dnf install nginx -y
    VALIDATE $? "nginx"
else 
    echo "nginx is already installed.... Nothing to do"
fi 