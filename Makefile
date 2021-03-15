.PHONY: vimrc

setup: vimrc update

update:
	git submodule foreach git pull -q origin master

save:
	@git add -A
	@git commit -m "$$(curl -s whatthecommit.com/index.txt)"

vimrc:
	ln -nfs ./vimrc ~/.vimrc
