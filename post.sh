#!/bin/bash

#checking that the number of arguments is equal to 3
if [ $# -ne 3 ]; then
        echo "nok: problem with the number of identifiers"
        exit 1
fi
sender=$1
receiver=$2
message=$3
DATE=`date +%d-%m-%Y`

# if the $sender does not exist
if [ ! -d $sender ]; then
        echo "nok: user $sender does not  exist"
        exit 2
# if the $receiver does not exist
elif [ ! -d $receiver ]; then
        echo echo "nok: user $receiver does not exist"
        exit 3
else
        # if the $receiver is not friend od $sender
        if ! grep "^$sender" "$receiver"/friends > /dev/null; then
                echo "nok: user $sender is not a friend of $receiver"
                exit 4
        else
		echo $sender[$DATE]: $message >> $receiver/wall
                echo "ok: message posted on $receiver wall"
        fi
fi
exit 0
