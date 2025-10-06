#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];then
    echo "ERROR: please run script with root user privilege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ];then
    echo "installation is Failure"
    exit 1
else
    echo "installation is Success"
fi