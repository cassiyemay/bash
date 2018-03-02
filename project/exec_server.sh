#!/bin/bash
if [ $# -ne 1 ]; then
	echo exec_server requires the username as argument.
	exit 0
fi

connectedUserName=$1

echo "HTTP/1.1 200 OK"
echo "Date: $(date)"
echo "Connection: close"
echo "Server: mylittlewebserver/0.1"
echo "Content-Type: text/html"


echo ""
echo "<html>"
echo "	<head>"
echo " 		<title> Connection </title>"
echo "	</head>"
echo " 	<body>"
echo " 		Welcome user: $connectedUserName <br/>"
echo " 		You have been redirected into a server/session that is dedicated for you <br/>"
echo "	</body>"
echo "</html>"