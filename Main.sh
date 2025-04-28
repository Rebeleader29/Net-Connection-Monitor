#!/bin/bash

clear
echo Initializing...
sleep 1

#Checks for config file
if test -f "ncm.conf"; then
  echo Using Stored Configuration
  sleep 1
else
  echo Using Default Configuration
  touch ncm.conf
  echo "IP=1.1.1.1" > ncm.conf
  sleep 1
fi

echo Seting Variables
sleep 1

#Sets Variables
Error=0
. ncm.conf
echo $IP
sleep 3

#Sets for break on error, otherwise continuous loop
while [ $Error == 0 ]
do
    clear
    Ping=$(ping -c 1 $IP)
    echo $Ping
    sleep 10
done