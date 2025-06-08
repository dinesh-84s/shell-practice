#!/bin/bash

USERID=$(id -u)

R="/e[31m"
G="/e[32m"
Y="/e[33m"
N="/e[0m"


if [ $USERID -ne 0 ]
then
    echo -e $R "ERROR:: please run the script with using root access $N"
    exit 1 #give other than 0 upto to 127
else 
    echo "you are running with the root access" 
fi

#vaildate functions takes input as exit status what command they tried to install
VALIDATE(){
if [ $1 -eq 0 ]
then
    echo "Installing $2 is... $G SUCCESS $N"
else
    echo "Installing $2 is... $R FAILURE $N"
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
    echo -e "Nothing  to do mysql.... $Y is already installed $N"
fi 

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo "python3 not installaed is going to be.. installed"
    dnf install python3 -y
    VALIDATE $? "python3"
else 
    echo -e "Nothing to do Python3.... $Y is already installed $N"
fi 

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo "nginx not installaed is going to be.. installed"
    dnf install nginx -y
    VALIDATE $? "nginx"
else 
    echo -e "Nothing to do nginx.... $Y is already installed $N"
fi 