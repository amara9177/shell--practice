#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];then
    echo "ERROR: please run script with root user privilege"
fi

dnf install mysql -y

if [ $? -ne 0 ];then
    echo "installation is Failure"
else
    echo "installation is Success"
fi