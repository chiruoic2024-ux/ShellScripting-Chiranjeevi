#! /bin/bash
# I have a requirement to install mysql, nginx and mongodb-mongosh softwares in linux servers

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR::Install MySql software with root user privileges"
    exit 1 # failure is other than 0
fi

VALIDATE(){
    if [ $? -ne 0 ]; then
    echo "ERROR:: MySql installation is failed"
    exit 1 # failure is other than 0
    else
    echo "Mysql installation is successful"
    fi

}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install mongodb-mongosh -y
VALIDATE $? "MongoDB"
