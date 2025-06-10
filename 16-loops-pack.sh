#!/bin/bash

USERID=$(id -u)

R="/e[31m"
G="/e[32m"
Y="/e[33m"
N="/e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("Mysql" "python3" "nginx" "httpd")
 
mkdir -p $LOGS_FOLDER
echo "statred and execute the skript at with: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e $R "ERROR:: please run the script with using root access $N" | tee -a $LOG_FILE
    exit 1 #give other than 0 upto to 127
else 
    echo "you are running with the root access" | tee -a $LOG_FILE
fi

#vaildate functions takes input as exit status what command they tried to install
VALIDATE(){
if [ $1 -eq 0 ]
then
    echo "Installing $2 is... $G SUCCESS $N" | tee -a $LOG_FILE
else
    echo "Installing $2 is... $R FAILURE $N" | tee -a $LOG_FILE
    exit 1
fi
}

for package in $@
do 
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
then 

    echo "$package not installaed is going to be.. installed" | tee -a $LOG_FILE
    dnf install $package -y &>>LOG_FILE
    VALIDATE $? $package
else 
    echo -e "Nothing  to do $package.... $Y is already installed $N" | tee -a $LOG_FILE
fi 

done 

