#!/bin/bash

echo "vim-enhanced will be installed - which takes a few minutes."

# install vim-enhanced
dnf install -y vim-enhanced

# create and config ~/.vimrc file
echo 'syntax on
set background=dark
set t_Co=256' > ~/.vimrc

# exec bash
exec /bin/bash
