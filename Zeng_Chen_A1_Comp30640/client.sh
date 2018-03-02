#!/bin/bash

if [ $# -eq 0 ];then
	echo "no user id provided."
	exit 1
fi


if [ $# -gt 1 ];then
	echo "please provide only one user id."
	exit 1
fi

if [[ -p "$1.pipe" ]]; then
	rm $1.pipe
fi
mkfifo $1.pipe

while true; do
	read -a args
	case ${args[0]} in
		create)
			echo "$1 create" > server.pipe
		;;		
		add)
			echo "$1 add ${args[1]}" > server.pipe
		;;
		post)
			echo "$1 post ${args[1]} ${args[2]}" > server.pipe
		;;
		display)
			echo "$1 display" > server.pipe
		;;
		*)
		;;
		
	esac
	while read line;
	do
		if [[ $line == start_of_file* ]]; then
			echo $line
		elif [[ $line == ok* ]]; then
			echo "command successfully executed."
		elif [[ $line == nok* ]]; then
			echo "Error: "	
		else
			echo $line
		fi
	done < $1.pipe
done
