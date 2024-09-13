#!/bin/bash

#/var/log/shell-practice/16-redirectors-<timestamp>.log  ---------->        example

L0G_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOG_FOLDER 

$R="\e[31m"
$G="\e[32m"
$N="\e[0m"
$Y="\e[33m"

USER_ID=$(id -u)

CHECK_ROOT(){
    if [ $USER_ID -ne 0 ]
    then
        echo "$R PLEASE RUN THROUGH ROOT PRIVILAGES $N" &>>$LOG_FILE
        exit 1
    fi
}

USAGE(){
    echo "USAGE: sh 16-redirectors.sh package1 package2"
}

if [$# -eq 0]
then 
    USAGE
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 installing is $R failed $N" &>>$LOG_FILE
        exit 1
    else 
        echo "$2 installing is $G success $N" &>>$LOG_FILE
}

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        echo "$package is not installed goinG to install"
        dnf install $package
        VALIDATE $? $package 
    else 
        echo "$Y $package is already installed $N" &>>$LOG_FILE
    fi
done