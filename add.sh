#!/bin/bash

#checking that the number of arguments is equal to 2
if [ $# -ne 2 ]; then
    echo "nok: problem with the number of identifiers"
	exit 1
fi

id=$1
friend=$2

#if the user $id does not exists
if [ ! -d $id ]; then
	echo "nok: user $id does not  exist"
    exit 2
#if the user $friend exists
elif [ ! -d $friend ]; then 
	echo "nok: user $friend does not exist"
	exit 3
else
	#if the friends list exists and $friend is not in it already
	if ! grep "^$friend" "$id"/friends > /dev/null; then
		echo $friend >> $id/friends
		echo "ok: friend added!"
	else
		echo "nok: could not add $friend as friend"
		exit 4
	fi	
fi

exit 0