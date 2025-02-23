#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}  # IF USER IS NOT PROVIDING NUMBER OF DAYS, WE ARE TAKING 14 AS DEFAULT

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R failuere $N"
        exit 1
    else 
        echo -e "$2.... $G success $N"
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    exit 1
}

if [ $# -lt 2 ]
then 
    USAGE
fi 

if [ ! -d $SOURCE_DIR ]
then  
    echo -e "$SOURCE_DIR does not exits...please check"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then  
    echo -e "$DEST_DIR does not exits...please check"
    exit 1
fi


echo "Script started executing at: $TIMESTAMP"  #&>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
echo "files are: $FILES"

if [ -n $FILES]
then
    echo "Files are: $FILES"
else 
    echo "No files found older than $days"
fi