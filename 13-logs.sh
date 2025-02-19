#!/bin/bash

USER=$(id -u)
R="\e[32m"
G="\e[33m"
Y="\e[34m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%M-%D-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e"$2 ... $R failuere"
    else 
        echo "$2....success"
    fi

}

echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
   echo "ERROR:: you must have sudo access to execute this script"
   exit 1
fi 

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
   dnf install mysql -y &>>$LOG_FILE
   VALIDATE $? "installing mysql"
else 
   echo -e " $G mysql is already....installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
   dnf install git -y &>>$LOG_FILE
   VALIDATE $? "installing git"
else 
   echo -e " $Y git is already....installed"
fi