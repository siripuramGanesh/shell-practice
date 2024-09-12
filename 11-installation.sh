#!/bin/bash
userid=$(id -u)
echo "print userid $userid"

if [ $userid -ne 0 ]
then 
    echo "please run the command through root privilages"
    exit 1
else
    echo "run the command"
fi

dnf install mysql