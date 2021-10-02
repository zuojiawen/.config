This repo is my config file. You can clone it to your home directory, then you can refer to the following USAGE to know how to usage it.  

# USAGE

## nvim
1. Need to install [vim-plug](https://github.com/junegunn/vim-plug) and run `:PlugInstall`. 
2. The coc.nvim plugin need nodejs sprcified version. Recommended to install via [brew](https://brew.sh/). 

## ranger
1. If you want to have icons in front of the filename, You need to install ranger plugin devicon2 in [ranger wiki page](https://github.com/ranger/ranger/wiki) or directly in [devicon2 page](https://github.com/cdump/ranger-devicons2)
2. The devicon2 plugin need to install the Nerd Font. 

## zsh
1. You need to run the following command: 
```
rm ~/.zshrc
ln -s ~/.config/zsh/.zshrc ~/.zshrc 
```
2. You need to install the plugin manager [zinit](https://github.com/zdharma/zinit), 
   You can install brew in 清华源 or Gitee to install zinit. 
3. For plugin powerlevel10k, you can type command "p10k configure" to config Powerlevel10k theme. 

# PROXY

RUN following script to config proxy in your WSL2. 
```
echo "Plelase enter the port: "
read port
host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export ALL_PROXY="http://$host_ip:$port" 
```
