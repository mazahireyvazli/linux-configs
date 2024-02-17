#!/bin/bash

zellij_env_file=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/user-zellij.zsh

read -r -p "Autostart zellij? [y/N] " isityes
if [[ "$isityes" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo 'eval "$(zellij setup --generate-auto-start zsh)"' >> $zellij_env_file
else
    echo "skipping autostart"
fi


read -r -p "Alias zellij? [y/N] " createalias
if [[ "$createalias" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    read -r -p "Provide alias name: " aliasname
    cat <<EOT >> $zellij_env_file
alias $aliasname="zellij"
EOT

else
    echo "skipping aliasing"
fi
