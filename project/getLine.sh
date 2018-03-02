#!/bin/bash

read line
echo "******get line*****"
echo $line

p1=`echo $line | awk -F'[=&]' '{print $2}'`
p2=`echo $line | awk -F'[=&]' '{print $4}'`
p3=`echo $line | awk -F'[=&]' '{print $6}'`

echo p1=$p1
echo p2=$p2
echo p3=$p3

#if [ $p3 -eq 
echo "HTTP/1.1 200 OK"
echo "Date: $(date)"
echo "Connection: close"
echo "Server: mylittlewebserver/0.1"
echo "Content-Type: text/html"


echo ""
echo "<html>"
echo "  <head>"
echo "          <title> Connection </title>"
echo "  </head>"
echo "  <body>"
echo "          Welcome user: You <br/>"
echo "          You have been redirected into a server/session that is dedicated for you <br/>"
echo "  </body>"
echo "</html>"
