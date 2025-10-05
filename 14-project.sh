#!/bin/bash

USERID=$( id -u )

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ];then
    echo  -e "ERROR:please run the script with root privilege"
    exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ];then
    echo  -e "installing $2 .... $R Failure $N"
    exit 1
else
    echo -e "installing $2 .... $G Success $N"
fi
}

dnf install mysql
if [ $? -ne 0 ];then
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo  -e "MY SQL is already exist...$Y skipping $N"
fi

dnf install nginx 
if [ $? -ne 0 ];then
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo  -e "nginx is already exist...$Y skipping $N"
fi
