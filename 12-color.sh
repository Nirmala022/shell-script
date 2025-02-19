#!/bin/bash

USER=$(id -u)
R="\e[32m"
G="\e[33m"
Y="\e[34m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e"$2 ... $R failuere"
    else 
        echo "$2....success"
    fi

}

if [ $USERID -ne 0 ]
then
   echo "ERROR:: you must have sudo access to execute this script"
   exit 1
fi 

dnf list installed mysql 
if [ $? -ne 0 ]
then
   dnf install mysql -y
   VALIDATE $? "installing mysql"
else 
   echo -e " $G mysql is already....installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
   dnf install git -y
   VALIDATE $? "installing git"
else 
   echo -e " $Y git is already....installed"
fi