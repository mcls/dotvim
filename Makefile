update:
	git submodule foreach git pull -q origin master

save:
	@git add -A
	@git commit -am "Saved config"
