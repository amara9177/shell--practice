#!/bin/bash

USERID=$( id -u )

if [ $USERID -ne 0 ];then
    echo "ERROR:please run the script with root privilege"
fi

dnf install mysql -y

if [ $? -ne 0 ];then
    echo "ERROR:installing mysql is Failure"
else
    echo "ERROR:installing mysql is Success"