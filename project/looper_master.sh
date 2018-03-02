#!/bin/bash


#initial client port
clientPort=8889

#set the initial client port in exec_master (the refresh) to 8889
sed "s|http://localhost:[0-9]*|http://localhost:$clientPort|" exec_master.sh > exec_master.sh_ && mv exec_master.sh_ exec_master.sh && chmod +x exec_master.sh


while true; do 
	#new connection
	 ./exec_master.sh | nc -l 8888 | ./read_master.sh $clientPort
	
	#increment the port and update the refresh header with the new port
	clientPort=$((clientPort+1))
	sed "s|url=http://localhost:[0-9]*|url=http://localhost:$clientPort|" exec_master.sh > exec_master.sh_ && mv exec_master.sh_ exec_master.sh && chmod +x exec_master.sh

done
