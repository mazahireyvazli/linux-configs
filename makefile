git:
	./setup-git.sh
zsh:
	./setup-zsh.sh

chmodx:
	chmod +x setup-*
	git update-index --chmod=+x --add setup-*
