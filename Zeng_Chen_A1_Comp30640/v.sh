#!/bin/bash

if [ -z "$1" ]; then
	echo "usage $0 muter-name" >&1
else
	rm "$1"
	exit 0
fi
