#! /bin/bash
USER_ID=$(id -u)
R="\e[31m "
G="\e[32m "
Y="\e[33m "
N="\e[0m  "

LOGS_DIR="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_DIR/$SCRIPT_NAME.log"
mkdir -p $LOGS_DIR
echo "Script execution started at: $(date)" | tee -a $LOG_FILE
if [ $USER_ID -ne 0 ]; then
    echo "ERROR::Install the softwares using root user priveleges!"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # Functions receives inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
    echo -e "Installing $2 .....$R Failure $N" | tee -a $LOG_FILE
    exit 1 # failure is other than 0
    else
    echo -e "Installing $2 .....$G Success $N" | tee -a $LOG_FILE
    fi

}
# $@ is for all special variables (it returns all special variables--what ever we send args it returns)
for package in $@
do
    if [ $? -ne 0 ];then #if exist status is not equal to 0 install software
    dnf install $package -y &>>LOG_FILE
    VALIDATE $? "$package"
    else
        echo "$package alerady exists ......$Y SKIPPING $N"
    fi
done