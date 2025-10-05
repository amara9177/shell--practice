#!/bin/bash

USERID=$( id -u )

if [ $USERID -ne 0 ];then
    echo "ERROR:please run the script with root privilege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ];then
    echo "ERROR:installing mysql is Failure"
    exit 1
else
    echo "ERROR:installing mysql is Success"
fi