#!/bin/bash

USER=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "ERROR:: you must have sudo access to execute this script"
   exit 1
fi 

dnf install mysql -y
if [ $? -ne 0 ]
then
   echo "installing mysql ... failuere"
else 
   echo "installing mysql....success"
fi

dnf install git -y
if [ $? -ne 0 ]
then
   echo "installing git ... failuere"
else 
   echo "installing git ....success"
fi

