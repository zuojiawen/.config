#!bin/bash


setting(){
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left  "['<Super>a']"
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right  "['<Super>d']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left  "['<Super>w']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right  "['<Super>s']"
	gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
	gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>m']"
  gsettings set org.gnome.desktop.interface text-scaling-factor 1.4
  gsettings set org.gnome.desktop.interface gtk-theme Juno
  gsettings set org.gnome.desktop.wm.preferences theme Juno
}


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

campus(){
  # ping baidu.com -c 1 || nmcli device wifi > /dev/null || nmcli device wifi connect csust-lt
  python3 $HOME/.config/zsh/scripts/csust-network-login/log2network.py
}

