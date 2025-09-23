#! /bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]; then
    echo "ERROR::Install MySql software with root user privileges"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: MySql installation is failed"
else
    echo "Mysql installation is successful"
fi