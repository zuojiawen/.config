This repo is my config file. You can clone it to your home directory, then you can refer to the following USAGE to know how to usage it.  

# USAGE

## zsh
1. Because the zsh configure file must be in home directory, you need to link the .zshrc file in .config directory to the home directory via run the following command: 
```
rm ~/.zshrc
ln -s ~/.config/zsh/.zshrc ~/.zshrc 
```
2. You can to install [oh-my-zsh](https://ohmyz.sh/#install)and the pluin [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [powerlecel10k](https://github.com/romkatv/powerlevel10k). 
3. For plugin powerlevel10k, you can type command "p10k configure" to config Powerlevel10k theme. 

## nvim
1. Need to install [vim-plug plugin manager](https://github.com/junegunn/vim-plug) and run `:PlugInstall`. 
2. The coc.nvim plugin need nodejs sprcified version. Recommended to install via [brew package manager](https://brew.sh/) if the linux system you are using is based on Debian. 
3. The coc plugin need dowmload via npm, you'd better swich the npm source to domestic source.

## ranger
1. Make directory to make trash is available.
```
mkdir -p ~/.local/share/Trash/files 
```
2. If you want to have icons in front of the filename, You need to install ranger plugin devicon2 in [ranger wiki page](https://github.com/ranger/ranger/wiki) or directly in [devicon2 page](https://github.com/cdump/ranger-devicons2)
3. The devicon2 plugin need to install the Nerd Font. 

## tmux
1. Because the tmux configure file must be in home directory, you need to link the .tmux.conf file in .config directory to the home directory via run the following command: 
```
ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf
```
2. First, you should to install tmux plugin manager [tpm](https://github.com/tmux-plugins/tpm), and then hit `<prefix> + I`. Note that the I is capital.  

# PROXY

If you want to using you windows's proxy in your wsl2, you can run following script to config proxy in your WSL2. 
```
echo -n "Plelase enter the port: "
read port
host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export ALL_PROXY="http://$host_ip:$port" 
```
