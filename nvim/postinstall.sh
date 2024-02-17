#!/bin/bash

## load configmap
. ../configmap.sh

cat <<EOT >> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/user-neovim.zsh
export PATH=\$PATH:/opt/nvim-linux64/bin
EOT


read -r -p "Alias nvim? [y/N] " createalias
if [[ "$createalias" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    read -r -p "Provide alias name: " aliasname
    cat <<EOT >> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/user-neovim.zsh
alias $aliasname="nvim"
EOT

else
    echo "skipping aliasing"
fi
