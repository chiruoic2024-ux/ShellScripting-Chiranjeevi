#! /bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]; then
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