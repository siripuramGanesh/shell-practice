#!/bin/bash

CHECK_ROOT(){
userid=$(id -u)
if [ $userid -ne 0 ]
then 
    echo "please run it through root privilages"
    exit 1
fi
}
CHECK_ROOT 

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is not installed "
        exit 1
    else 
        echo "$2 is installed"
    fi
}

dnf list installed mysql



if [ $? -ne 0 ]
then 
    echo "mysql is not installed going to install it"
    dnf install mysql -y
    VALIDATE $? "mysql"
else 
    echo "mysql is already installed"
fi


dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo "nginx is not installed going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed"
fi
