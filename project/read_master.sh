#!/bin/bash

if [ $# -ne 1 ]; then
	echo "The user to be assigned a new port"
	exit 1
fi
clientPort=$1
echo port=$clientPort
read line

while [ ! -z "$line" ]; do
	
	if [[ $line == GET* ]] ; then
		# get a new GET command
		url=`echo -e $line | cut -d' ' -f2`  #get the url
		echo url=$url
		
		#We assume that the user is going to connect by putting his userNamer is the url
		# e.g., http://localhost:8888/Takfarinas
		userName=`echo -n "$url" | sed 's|\/||'`  #take out the slash "/"
		echo userName="$userName"
		

		# start a server to listen to the client on the clientPort
		./looper_server.sh $clientPort $userName &
		
				
	fi
	read line
done
