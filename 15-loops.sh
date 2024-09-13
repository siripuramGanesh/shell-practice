#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $userid -ne 0 ]
    then
        echo "please run through root privilages" 
        exit 1
    fi
}

CHECK_ROOT

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "Installing $package is $R failed $N"
        exit 1
    else
        echo "Installing $package is $G success $N"
    fi
}

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
        then
        echo "$package is not installed going to install it"
        dnf install $package
        VALIDATE $1 $package
        else
        echo "$package is already installed"
    fi

done

