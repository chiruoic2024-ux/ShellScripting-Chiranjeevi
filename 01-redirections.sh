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
dnf list installed mysql &>>$LOG_FILE
#Install if it is not found
if [ $? -ne 0 ]; then
dnf install mysql -y &>>$LOG_FILE
VALIDATE $? "MySQL"
else    
    echo -e "MySQL already exist....$G SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
dnf install nginx -y &>>$LOG_FILE
VALIDATE $? "Nginx"
else    
    echo -e "Nginx already exist....$G SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
dnf install python3 -y &>>$LOG_FILE
VALIDATE $? "python3"
else    
    echo -e "Python3 already exist....$G SKIPPING $N" | tee -a $LOG_FILE
fi
