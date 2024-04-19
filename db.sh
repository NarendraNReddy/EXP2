#!/usr/bin 
USERID=$(id -u)
echo $USERID


if [ $USERID -ne 0 ];
then 
    echo "Please try the instructions in super user mode"
    exit 1 
else
    echo "Super User"    
fi





