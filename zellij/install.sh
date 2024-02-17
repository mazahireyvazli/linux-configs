#!/bin/bash

dir="/usr/local/bin"
mkdir -p "$dir"

case $(uname -m) in
    "x86_64"|"aarch64")
        arch=$(uname -m)
    ;;
    "arm64")
        arch="aarch64"
    ;;
    *)
        echo "Unsupported cpu arch: $(uname -m)"
        exit 2
    ;;
esac

case $(uname -s) in
    "Linux")
        sys="unknown-linux-musl"
    ;;
    "Darwin")
        sys="apple-darwin"
    ;;
    *)
        echo "Unsupported system: $(uname -s)"
        exit 2
    ;;
esac

url="https://github.com/zellij-org/zellij/releases/latest/download/zellij-$arch-$sys.tar.gz"
wget "$url"
tar -xvf zellij*.tar.gz
sudo mv zellij $dir
rm zellij*.tar.gz

# create config dir
mkdir -p ~/.config/zellij
cp ./config.kdl ~/.config/zellij/config.kdl
