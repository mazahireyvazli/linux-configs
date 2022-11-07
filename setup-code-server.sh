set -e

read -r -p "Install code server cli? [y/N] " should_install_code
if [[ "$should_install_code" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    curl -fsSL https://code-server.dev/install.sh | sh
else
    echo "skipping code server installation"
fi


cat <<EOT > ~/.config/code-server/config.yaml
bind-addr: 0.0.0.0:7070
auth: password
hashed-password: 20cc57755ab2655a4ffc01bc44cf287ece58ba64d99d4dd0028c0f42c4debcbc
cert: false
EOT

## run code server in home dir  
# code-server ~
