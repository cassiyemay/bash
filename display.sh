#!/bin/bash

#checking that the number of arguments is equal to 1
if [ $# -ne 1 ]; then
    echo "nok: problem with the number of identifiers"
    exit 1
fi

id=$1

#if the user $id does not exists
if [ ! -d $id ]; then
    echo "nok: user $id does not exist"
    exit 2
else
	#print the wall of the user $id
	cat $id/wall
fi                
exit 0