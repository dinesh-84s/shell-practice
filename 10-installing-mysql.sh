#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: please run the script with using root access"
    exit 1 #give other than 0 upto to 127
else 
    echo "you are running with the root access"
fi

dnf list installed mysql
if [ $USERID -ne 0 ]
then 
    echo "Mysql not installaed is going to be.. installed"

dnf install mysql -y


if [ $? -eq 0 ]
then
    echo "Installing Mysql is... SUCCESS"
else
    echo "Installing Mysql is... FAILURE"
    exit 1

    fi
else   
  
    echo "mysql is installed nothing to do"

fi



# dnf install mysql -y


# if [ $? -eq 0 ]
# then
#     echo "Installing Mysql is... SUCCESS"
# else
#     echo "Installing Mysql is... FAILURE"
#     exit 1

#     fi