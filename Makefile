all: vundle vimrc ctags

vimrc: 
	ln -fs $(CURDIR)/.vimrc ~/.vimrc

ctags:
	ln -fs $(CURDIR)/.ctags ~/.ctags

bundle:
	mkdir bundle

vundle: bundle
	cd $?
	@echo [ -d $@ ] || git clone https://github.com/gmarik/vundle.git
	@cd $?/$@ && git pull
