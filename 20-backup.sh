#!/bin/bash

SOURCE_DIR=$1
DEST-DIR=$2
DAYS=${3:-14} #If days are provided that will be considerd, otherwise 14 days is taken  

LOGS_FOLDER="/var/log/shell-script-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "$2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}

check_root(){
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access" | tee -a $LOG_FILE
fi
}

check_root
mkdir -p $LOGS_FOLDER

USAGE(){
    echo "$R is USAGE:: $N is 20-backup.sh <source-dir> <destinamtion-dir> <days(optional)>"
}

if [ $# -lt 2 ]
then 
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R Soyrce directory $SOURCE_DIR does no exist.. then please check $N"
    exit 1
fi 

if [ ! -d $DEST_DIR ]
then
    echo -e "$R Destination directory $DEST_DIR does no exist.. then please check $N"
    exit 1
fi



