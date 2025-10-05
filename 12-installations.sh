#!/bin/bash

USERID=$( id -u )

if [ $USERID -ne 0 ];then
    echo "ERROR:please run the script with root privilege"
    exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ];then
    echo "ERROR:installing $2 is Failure"
    exit 1
else
    echo "ERROR:installing $2 is Success"
fi
}

dnf install mysql -y
validate $? "my sql"

dnf install nginx -y
validate $? "nginx"

dnf install python03 -y
validate $? "python03"