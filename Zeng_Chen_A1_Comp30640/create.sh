#!/bin/bash

if [ $# -eq 0 ]; then
	echo "nok: on identifier provided" >&2
	exit 1
fi

if [ $# -gt 1 ]; then
	echo  "nok: please provide only 1 id" >&2
	exit 2
fi

if [ $# -eq 1 ];then
	if [ -d "$1" ]; then
		echo "nok: user already exists"
	else
		mkdir $1
		touch "$1/wall"
		touch "$1/friends"
		echo  "ok: user created."	
	fi

fi

