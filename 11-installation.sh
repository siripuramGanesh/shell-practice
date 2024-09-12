#!/bin/bash
userid=$(id -u)
echo "print userid $userid"

if [ $userid -ne 0 ]
then 
    echo "please run the command through root privilages"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed going to install it"
    dnf install mysql -y
    if [$? -ne 0]
    then
        echo "mysql is not installed "
        exit 1
    else
        echo "it is  installed "
    fi
else
    echo "mysql is already installed nothing to do"
fi


dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo "nginx is not installed going to install it" 
    dnf install nginx -y
    if [ $? -ne 0]
    then 
        echo "nginx is not installed yet "
        exit 1
    else
        echo "nginx is installed"
    fi
else 
    echo "nginx is already installed"