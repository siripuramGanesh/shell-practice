#!/bin/bash

L0G_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOG_FOLDER

USER_ID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USER_ID -ne 0 ]
    then
        echo -e "$R PLEASE RUN THROUGH ROOT PRIVILAGES $N" &>>$LOG_FILE
        exit 1
    fi
}

USAGE(){
    echo -e "$R USAGE: $N sh 16-redirectors.sh package1 package2"
    exit 1
}

if [ $# -eq 0 ]
then 
    USAGE
fi
CHECK_ROOT

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 installing is $R failed $N" &>>$LOG_FILE
        exit 1
    else 
        echo "$2 installing is $G success $N" &>>$LOG_FILE
    fi
}

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo "$package is not installed goinG to install"
        dnf install $package &>>$LOG_FILE
        VALIDATE $? $package 
    else 
        echo "$Y $package is already installed $N" &>>$LOG_FILE
    fi
done