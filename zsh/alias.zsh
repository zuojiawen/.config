# python
alias cv='python3 -m venv .venv'
alias av='source .venv/bin/activate'

# git
alias 'gitclone'='git clone https://github.com/zuojiawen/.config.git'
alias gitstorepassword='git config credential.helper store'
alias gc='git clone'

# some package 
alias ra='ranger'
alias lgit='lazygit'

# Proxy
alias pmode='gsettings get org.gnome.system.proxy mode'
alias pmanual='gsettings set org.gnome.system.proxy mode manual'
alias pnone='gsettings set org.gnome.system.proxy mode none'


# shell built-in command
alias l='ls -la'
alias e='exit'

# pacman mirrors generation
alias mirror='sudo pacman-mirrors -i -c China -m rank'

