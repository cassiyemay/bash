#!/bin/bash

if [ $# -ne 1 ]; then
	echo "The server need to get the userName as argument"
	exit 1
fi

echo userName=$1

read line

while [ ! -z "$line" ]; do
	
	if [[ $line == GET* ]] ; then
		# get a new GET command
		url=`echo -e $line | cut -d' ' -f2`  #get the url
		echo url=$url
		
		###
		###
		# Do Something with the url (request from the user)
		###
		###		
	fi
	read line
done
