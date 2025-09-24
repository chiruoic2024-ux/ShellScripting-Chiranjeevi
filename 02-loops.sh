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

for package in $@
do
    echo "Package is: $package"
done