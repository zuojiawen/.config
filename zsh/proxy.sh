#!bin/bash

echo -n "Plelase enter the port: "
read port
host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export ALL_PROXY="http://$host_ip:$port" 
