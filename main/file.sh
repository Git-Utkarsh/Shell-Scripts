#!/bin/bash
#Check the user is root or not

if [[ $UID = "0"]]
then
    echo "You are the root user"
else 
    echo "You are not a root user"
fi

#Check weather website is up or down
for site in www.google.com
do 
if curl -I "$site" 2>&1 | grep -w "200\|301"; then
    echo "$site is up"
else
    echo "$site is down"
fi
done

#How to check system information

echo -e "*****************HOSTNAME INFO********************"
hostnamectl
echo ""
echo -e "*****************DISK SPACE USAGE******************"
df -h
echo "" 

echo -e "****************Currently Logged-in user***********************"
who
echo "" 

echo -e "*****************System Free and used memory************************"
free
echo ""

echo -e "**********************System Uptime**************************************"
uptime
echo "" 
