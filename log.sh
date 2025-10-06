#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell--script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME.log
echo "script started executed at: $(date)"

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

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ];then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "Mysql"
else
    echo -e "Mysql already exist...$Y skipping $N"
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ];then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist...$Y skipping $N"
fi

dnf list installed python3 &>>$LOG_FILE
    if [ $? -ne 0 ];then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo  -e "Nginx already exist...$Y skipping $N"
fi