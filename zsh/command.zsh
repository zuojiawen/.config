#!bin/bash

proxy(){
	echo -n "Plelase enter the port: "
	read port
	export http_proxy="http://127.0.0.1:$part"
	export https_proxy="https://127.0.0.1:$port"
    echo "Proxy on"
}

unproxy(){
	unset http_proxy 
	unset https_proxy 
}

wslproxy(){
	echo -n "Plelase enter the port: "
	read port
	host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
	export ALL_PROXY="http://$host_ip:$port" 
}

unwslproxy(){
	unset ALL_PROXY
}
