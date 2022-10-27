## load configmap
. ./configmap.sh

## Install zsh
sudo ${pkg_manager} install zsh

## Change default shell to zsh
sudo chsh -s $(which zsh) ${USER}

## Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Install zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Add zsh-autosuggestions to the plugin list in ~/.zshrc
# plugins=(git some_other_plugins zsh-autosuggestions)
