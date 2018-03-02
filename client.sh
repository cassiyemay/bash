#!/bin/bash

# the script should have at least one parameter (the user id)
if [ $# -eq 0 ]; then
	echo "nok: no identifier provided"
	exit 1
fi 

#saving the client id in a variable for later use (note also that we cannot use $1 in the functin ctrl_c)
id=$1

# create the client pipe if it does not exist already
if [ ! -e $id.pipe ]; then
	mkfifo $id.pipe
fi

# deleting the $id.pipe and exiting the program when the signal crtl+c is received 
trap ctrl_c INT
function ctrl_c(){
	echo "clean exit: deleting $id.pipe"
	echo "Bye bye! see you soon"
	rm $id.pipe
	exit 0
}


while true; do
	#read a command from the prompt
	read command id2 message
	#send the command in the server's pipe (with the extra param "id")
	echo $command $id $id2 "$message" > server.pipe
	#read server's response
	read response < $id.pipe
	# define what to print depending on how $response starts: ok, nok or start_of_the_file 
	if [[ $response == ok:* ]]; then
		echo "SUCCESS:" `echo $response | cut -d':' -f'2'`
	
	elif [[ $response == nok:* ]];then
		echo "ERROR:"  `echo $response | cut -d':' -f'2'`
	
	elif [[ $response == start_of_the_file ]];then
		# read the wall line by line until "end_of_the_file"
		read lineInWall < $id.pipe
		while [[ ! $lineInWall == end_of_the_file ]];
		do
			echo $lineInWall
			read lineInWall < $id.pipe
		done
	else
		# unknown response
		echo $response
	fi
done
