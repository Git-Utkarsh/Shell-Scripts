#!/bin/bash

# List partitions 

echo "List partitions under the disk"
for i in /dev/sda*; do
echo "$i"
done

for i in {1..5}; do echo "Number: $i"; done
for ((i=1; i<=5; i++)); do echo "Number: $i"; done


#Check the user is root or not

if [[ $UID = "0"]]
then
    echo "You are the root user"
else 
    echo "You are not a root user"
fi

#Add user to linux including password

if [[ $UID = "0"]] then
read -p "Enter the username:" username
read -s -p "Enter the password:" passwd
egrep "^$username" /etc/passwd > /dev/null

if [ $? -eq 0 ]; then
echo "$username exists!"
exit 1
else 
    pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
    useradd -m -p "$pass" "$username"
    [ $? -eq 0 ] && echo "User has been added" || echo "Failed to add a user"
    fi

else 
    echo "You are not a root user"
    exit 2
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
