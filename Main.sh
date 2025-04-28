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
  echo "IP=1.1.1.1
  Delay=300" > ncm.conf
  sleep 1
fi

echo Seting Variables
sleep 1

#Sets variables and displays them
. ncm.conf
DelayMinute=$((Delay / 60))
echo $IP
echo Delay $DelayMinute "Minute(s)"
sleep 3

#Continuous loop
while [ 0 == 0 ]
do
    clear
    Ping=$(ping -c 1 -q $IP)
    echo $Ping
    ping -c 1 -q $IP > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        Stats=$(speedtest-cli --simple)
        echo $Stats
        echo $Stats > ncm.log
    else
        echo NETWORK CONNECTION ERROR
        echo NETWORK CONNECTION ERROR > ncm.log
    fi
    sleep $Delay
done