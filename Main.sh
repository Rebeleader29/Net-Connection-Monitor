#!/bin/bash

Error=0

#Sets for break on error, otherwise continuous loop
while [ $Error == 0 ]
do
Ping=$(ping -c 1 1.1.1.1)
clear
echo $Ping
sleep 10
done