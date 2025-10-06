#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

USERID=$(id -u)

if [ $USERID -ne 0 ];then
    echo  "ERROR:: please run script with root user privilege"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];then
        echo " installing $2...$R Failure $N"
        exit 1
    else
        echo  " installation $2...$G Success $N"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ];then
    dnf install mysql -y
    VALIDATE $? "Mysql"
else
    echo -e "Mysql already exist...$Y skipping $N"
fi

dnf list installed nginx
if [ $? -ne 0 ];then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist...$Y skipping $N"
fi

dnf list installed python03
    if [ $? -ne 0 ];then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo  -e "Nginx already exist...$Y skipping $N"
fi