.PHONY: vimrc

setup: vimrc update

update:
	git submodule foreach git pull -q origin master

save:
	@git add -A
	@git commit -am "Saved config"

vimrc:
	ln -nfs ./vimrc ~/.vimrc
