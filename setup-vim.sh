set -e

VIM_DIR=./vim
VIM_USER_DIR=~/.vim

rsync -a --delete ${VIM_DIR}/ ${VIM_USER_DIR}/

cp ./vim/.vimrc ~/
