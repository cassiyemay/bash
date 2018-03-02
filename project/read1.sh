#!/bin/bash


read x

while [ ! -z "$x" ]; do
	if [[ $x == GET* ]] ; then
		url=`echo $x | cut -d' ' -f2`
		echo url= $url
		PARAM="$( cut -d '?' -f 2 <<< "$x" )"
		ACTION="$( cut -d '=' -f 1 <<< "$PARAM" )"
		NAME="$( cut -d '=' -f 2 <<< "$PARAM" )"
		case ${ACTION} in
		create)
			./create.sh $NAME
			;;
		add)
			./add_friend.sh $NAME ${args[2]} > "$NAME".pipe
			;;
		post)
			./post_messages.sh $NAME ${args[2]} ${args[3]} > "$NAME".pipe
			;;
		display)
			./display_wall.sh $NAME > "$NAME".pipe
			;;
		*)
			echo "nok Usage: $0 {create|add|post|display}" > "$NAME".pipe
			exit 1
		esac	
	fi
	read x
done

