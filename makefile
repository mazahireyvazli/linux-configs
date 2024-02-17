git:
	./setup-git.sh
zsh:
	./setup-zsh.sh

zellij-setup:
	${MAKE} -C ./zellij zellij-scripts

nvim-setup:
	${MAKE} -C ./nvim nvim-scripts

chmodx:
	find . -name "*.sh" -exec chmod +x {} \;
	git update-index --chmod=+x --add *.sh

gpg-gen:
	gpg --full-generate-key

gpg-list:
	gpg --list-secret-keys --keyid-format=long

gpg-export:
	gpg --armor --export KEY_ID

gpg-backup:
	gpg --output ./certs.local/GH_SIGNING_KEY_BACKUP.pgp --armor --export-secret-keys --export-options export-backup mazahir.eyvazli@gmail.com

gpg-import:
	gpg --import ./certs.local/GH_SIGNING_KEY_BACKUP.pgp
