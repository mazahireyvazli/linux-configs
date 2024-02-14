#!/bin/bash

## load configmap
. ./configmap.sh

read -r -p "Install git cli? [y/N] " should_install_git
if [[ "$should_install_git" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    sudo ${pkg_manager} update -y
    sudo ${pkg_manager} install git
else
    echo "skipping git installation"
fi

cp -r ./gitconfig/. ${HOME}

### WSL specific GPG configs
cat <<EOT >> ~/.gnupg/gpg.conf
use-agent 
pinentry-mode loopback
EOT

cat <<EOT >> ~/.gnupg/gpg-agent.conf
use-standard-socket
allow-loopback-pinentry
EOT

[ -f ~/.zshrc ] && echo -e '\nexport GPG_TTY=$(tty)' >> ~/.zshrc  
[ -f ~/.bashrc ] && echo -e '\nexport GPG_TTY=$(tty)' >> ~/.bashrc

echo "update access tokens and signing keys in git configurations"
