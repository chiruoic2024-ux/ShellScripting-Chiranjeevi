#! /bin/bash
# I have a requirement to install mysql, nginx and mongodb-mongosh softwares in linux servers
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR::Install MySql software with root user privileges"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # Functions receives inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
    echo "ERROR:: $2 installation is failed"
    exit 1 # failure is other than 0
    else
    echo "$2 installation is successful"
    fi

}
dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "python3"
