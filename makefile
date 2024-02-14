git:
	./setup-git.sh
zsh:
	./setup-zsh.sh

chmodx:
	chmod +x setup-*
	git update-index --chmod=+x --add setup-*

gpg-gen:
	gpg --full-generate-key

gpg-list:
	gpg --list-secret-keys --keyid-format=long

gpg-export:
	gpg --armor --export KEY_ID

gpg-backup:
	gpg --output ./certs.local/GH_SIGNING_KEY_BACKUP.pgp --armor --export-secret-keys --export-options export-backup mazahir.eyvazli@gmail.com
