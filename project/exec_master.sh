#!/bin/bash

# Redirection to the new server
echo "HTTP/1.1 200 OK"
echo "Date: $(date)"
echo "Connection: close"
echo "Server: mylittlewebserver/0.1"
echo "Refresh: 0;url=http://localhost:8909" # needs to be set to 8889 when starting the looper.sh

echo ""
echo "<html>"
echo "	<head>"
echo " 		<title> Connection </title>"
echo "	</head>"
echo " 	<body>"
echo " 		Redirection ... <br/>"

echo "	</body>"
echo "</html>"

