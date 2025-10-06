#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];then
    echo "ERROR:: please run script with root user privilege"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];then
        echo " installing $2 Failure"
        exit 1
    else
        echo  " installation $2 Success"
    fi
}

dnf install mysql -y
VALIDATE $? "Mysql"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python03 -y
VALIDATE $? "Python03"