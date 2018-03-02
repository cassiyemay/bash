#!/bin/bash

id=$1
friend=$2

if [ ! -d $id ]; then
	echo "nok: user '$id' does not exist"
	exit 1
fi

if [ ! -d $friend ]; then
	echo "nok: user '$friend' does not exist"
	exit 1
fi

if grep "^$friend" "$id"/friends > /dev/null ; then
	echo "$friend is already a friend of $id"
else
	echo "$friend" >> "$id"/friends
	echo "$id" >> "$friend"/friends
	echo "ok"
fi 
