#! /bin/bash
# I have a requirement to install mysql, nginx and mongodb-mongosh softwares in linux servers

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR::Install MySql software with root user privileges"
    exit 1 # failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: MySql installation is failed"
    exit 1 # failure is other than 0
else
    echo "Mysql installation is successful"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "ERROR:: nginx installation is failed"
    exit 1 # failure is other than 0
else
    echo "nginx installation is successful"
fi

dnf install mongodb-mongosh -y

if [ $? -ne 0 ]; then
    echo "ERROR:: mongodb installation is failed"
    exit 1 # failure is other than 0
else
    echo "mongodb installation is successful"
fi