This repo is my config file. 

# USAGE

## zsh
1. Because the zsh configure file must be in home directory, you need to link the .zshrc file in .config directory to the home directory via run the following command: 
```
rm ~/.zshrc
ln -s ~/.config/zsh/.zshrc ~/.zshrc 
```
2. You can to install [oh-my-zsh](https://ohmyz.sh/#install). 
The following are pluins i use.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [powerlecel10k](https://github.com/romkatv/powerlevel10k)
- [history-substring-search](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/history-substring-search)
- [z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z)

## nvim
Install [astronvim](https://astronvim.github.io)

## ranger
1. Make directory to make trash is available.
```
mkdir -p ~/.local/share/Trash/files 
```
2. If you want to have icons in front of the filename, You need to install ranger plugin devicon2 in [ranger wiki page](https://github.com/ranger/ranger/wiki) or directly in [devicon2 page](https://github.com/cdump/ranger-devicons2)
3. The devicon2 plugin need to install the Nerd Font. 

