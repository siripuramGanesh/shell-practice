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
    if [ $? -ne 0 ]
    then
        echo "Installing is failed"
        exit 1
    else
        echo "Installing is success"
    fi
}

for package in $@
do
 echo "$package"
done

