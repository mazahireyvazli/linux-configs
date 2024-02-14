#!/bin/bash

## load configmap
. ./configmap.sh


read -r -p "Type go version " go_version

sudo rm -rf /usr/local/go

wget https://go.dev/dl/go${go_version}.linux-amd64.tar.gz
sudo tar -C /usr/local/ -xzf ./go${go_version}.linux-amd64.tar.gz

rm -rf ./go${go_version}.linux-amd64.tar.gz

cat <<EOT >> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/user-zsh-path.zsh
export PATH=\$PATH:/usr/local/go/bin
EOT
