#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
BL="\e[34m"
N="\e[0m"

echo "Enter password:"
read DB_SERVER_PASSWORD
#ExpenseApp@1

VALIDATE()
{
    if [ $1 -ne 0 ];
    then 
        echo -e "$2 is ... $R FAILURE $N"
    else 
        echo -e "$2 is ... $G SUCCESS $N"    
    fi
}

USERID=$(id -u)

if [ $USERID -ne 0 ];
then 
    echo "Be a super user to install the commands"
    exit 1
else 
    echo "Super User"     
fi



dnf module disable nodejs -y 
VALIDATE $? "Disable Node JS"


dnf module enable nodejs:20 -y
VALIDATE $? "Enable Node Js:20"


dnf install nodejs -y
VALIDATE $? "Installation Node JS "


id expense 
if [ $? -ne 0];
then
    useradd expense 
    VALIDATE $? "Adding the user expense"
else 
    echo -e "User expense is already present ... $Y SKIPPING $N"    
fi 


#mkdir /app 


#curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip


#cd /app


#unzip /tmp/backend.zip


#npm install


#systemctl daemon-reload 


#systemctl start backend


#systemctl enable backend


#dnf install mysql -y 


#mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pExpenseApp@1 < /app/schema/backend.sql

#systemctl restart backend