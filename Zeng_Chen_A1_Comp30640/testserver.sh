#!/bin/bash

while true; do
	read -a args
	./p.sh test_semaphore 
	case ${args[0]} in
		create)
			./create.sh ${args[1]}
			;;
		add)
			./add_friend.sh ${args[1]} ${args[2]}
			;;
		post)
			./post_messages.sh ${args[1]} ${args[2]} ${args[3]} 
			;;
		display)
			./display_wall.sh ${args[1]}
			;;
		*)
			echo "Usage: $0 {create|add|post|display}"
			exit 1
	esac
	./v.sh test_semaphore
	
done
