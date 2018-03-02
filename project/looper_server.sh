#!/bin/bash

if [ $# -ne 2 ]; then
	echo "The server needs the port and the username as arguments"
fi
clientPort=$1
clientName=$2

while true; do 
	 echo "READ"
	 ./exec_server.sh $clientName | nc -l $clientPort | ./read_server.sh $clientName
	 echo "EXEC"
	
done
