#! /bin/bash
# I have a requirement to install mysql, nginx and mongodb-mongosh softwares in linux servers
USERID=$(id -u)
R="\e[31m "
G="\e[32m "
Y="\e[33m "
N="\e[0m  "

if [ $USERID -ne 0 ]; then
    echo "ERROR::Install MySql software with root user privileges"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # Functions receives inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
    echo -e "Installing $2 .....$R Failure $N"
    exit 1 # failure is other than 0
    else
    echo "Installing $2 .....$R Success $N"
    fi

}
dnf list installed mysql
#Install if it is not found
if [ $? -ne 0 ]; then
dnf install mysql -y
VALIDATE $? "MySQL"
else    
    echo -e "MySQL already exist....$G SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
dnf install nginx -y
VALIDATE $? "Nginx"
else    
    echo -e "Nginx already exist....$G SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
dnf install python3 -y
VALIDATE $? "python3"
else    
    echo -e "Python3 already exist....$G SKIPPING $N"
fi