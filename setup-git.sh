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

git config --global user.email $git_user_email
git config --global user.name $git_user_name
git config --global init.defaultbranch $git_init_default_branch
