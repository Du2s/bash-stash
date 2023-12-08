#!/bin/bash
set -e

grep -qF "filetype plugin indent on" /home/$USER/.vimrc || \
echo "filetype plugin indent on" >> /home/$USER/.vimrc

grep -qF "autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab" /home/$USER/.vimrc || \
echo "autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab" >> /home/$USER/.vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

grep -qF "execute pathogen#infect()" /home/$USER/.vimrc || \
echo "execute pathogen#infect()" >> /home/$USER/.vimrc

cd ~/.vim/bundle && \
git clone https://github.com/pedrohdz/vim-yaml-folds.git && \
git clone https://github.com/Yggdroot/indentLine.git
