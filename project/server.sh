#!/bin/bash

# create the server pipe if it does not already exist
if [ ! -e server.pipe ]; then
	mkfifo server.pipe
fi

# deleting the server pipe and exiting the program when the signal crtl+c is received
trap ctrl_c INT
function ctrl_c(){
        echo "clean exit (deleting server.pipe)"
	echo "bye!"
        rm server.pipe
        exit 0
}

while true; do
	# read a new command from the server pipe
	read command id id2 message < server.pipe
	
	# check if $id is not empty
	if [ -n $id ]; then
		case $command in
			create)
				#lock the user $id account
				./P.sh $id.lock
				#execute the command create and send the standard output in the user $id pipe
				./create.sh $id > $id.pipe
				#unlock the user $id account
				./V.sh $id.lock 
				;;
			add) 
				./P.sh $id.lock
				./add.sh $id $id2 > $id.pipe
				./V.sh $id.lock
				;;
			post)
				#Here we lock the account of user $id2 as we are making changes on it
				#There is no need to lock the account of user $id as no modification are made here on it
				./P.sh $id2.lock
				./post.sh $id $id2 "$message" > $id.pipe
				#unlock the account of user $id2
				./V.sh $id2.lock
				;;
			display)
				# inform the client that we will start senting the content of the wall
				echo "start_of_the_file" > $id.pipe
				#execute the display command and save the result in a variable
				clientWall=`./display.sh $id`
				# send the content of the wall stored in clientWall to the client line by line
				IFS=$'\n' # changing the delimiter to a new line
				for line in $clientWall; do
					echo $line  > $id.pipe
				done
				IFS=$' ' # bring back the delimiter into its original state (i.e., space)
				echo "end_of_the_file" > $id.pipe
				;;
			*)
				echo "These are the only valid commands: {create|add|post|display}" > $id.pipe
				#exit 1
		esac
	fi
done
exit 0
