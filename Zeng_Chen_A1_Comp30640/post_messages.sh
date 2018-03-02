#!/bin/bash

sender=$1
receiver=$2
message="$3"

if [ ! -d $sender ]; then
	echo "nok: user '$sender' does not exist"
	exit 1
fi

if [ ! -d $receiver ]; then
	echo "nok: user '$receiver' does not exist"
	exit 1
fi

if grep "^$receiver" "$sender"/friends > /dev/null ; then
	echo "$sender: $message" >> "$receiver"/wall
	echo "ok"
else
	echo "nok user '$sender' is not a friend of '$receiver'"
fi 
