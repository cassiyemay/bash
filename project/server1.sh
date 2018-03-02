#!/bin/bash

while true; do
	./server2.sh | nc -l 8888
done
