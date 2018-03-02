#!/bin/bash

if [[ -p "server.pipe" ]]; then
	rm server.pipe
fi
mkfifo server.pipe
while true; do
while read -a args; do
	# 0: user id, 1: request, ...
	user_id=${args[0]}
	all_args=$@ 
	case ${args[1]} in
		create)
			./create.sh $user_id > "$user_id".pipe
			;;
		add)
			./add_friend.sh $user_id ${args[2]} > "$user_id".pipe
			;;
		post)
			./post_messages.sh $user_id ${args[2]} ${args[3]} > "$user_id".pipe
			;;
		display)
			./display_wall.sh $user_id > "$user_id".pipe
			;;
		*)
			echo "nok Usage: $0 {create|add|post|display}" > "$user_id".pipe
			exit 1
	esac
done < server.pipe
done
