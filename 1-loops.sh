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
        echo -e " installing $2...$R Failure $N"
        exit 1
    else
        echo -e " installation $2...$G Success $N"
    fi
}

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ];then
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
else
    echo -e "$package already exist...$Y skipping $N"
    fi
done
