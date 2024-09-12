#!/bin/bash
userid=$(id -u)
echo "print userid $userid"

if [ $userid -ne 0 ]
then 
    echo "please run the command through root privilages"
    exit 1
fi

dnf installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed going to install it"
else
    echo "mysql is already installed nothing to do"
fi