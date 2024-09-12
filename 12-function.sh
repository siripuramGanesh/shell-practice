#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "please run it through root privilages"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "mysql is not installed "
        exit 1
    else 
        echo "mysql is installed"
    fi
}

dnf list installed mysql



if [ $? -ne 0 ]
then 
    echo "mysql is not installed going to install it"
    dnf install mysql -y
    VALIDATE $? 
else 
    echo "mysql is already installed"
fi


dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo "nginx is not installed going to install it"
    dnf install nginx -y
    VALIDATE $?
else
    echo "nginx is already installed"
fi
