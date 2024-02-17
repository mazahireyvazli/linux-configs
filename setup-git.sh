#!/bin/bash

## load configmap
. ./configmap.sh

read -r -p "Install git cli? [y/N] " should_install_git
if [[ "$should_install_git" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    # ubuntu specific
    sudo apt-add-repository ppa:git-core/ppa
    # end of ubuntu specific
    sudo ${pkg_manager} update -y
    sudo ${pkg_manager} install git
else
    echo "skipping git installation"
fi

cp -r ./gitconfig/. ${HOME}

cat <<EOT >> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/user-git.zsh
export GPG_TTY=\$(tty)
EOT
