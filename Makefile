all: vundle vimrc ctags
	vim +BundleInstall +qall!
	sudo apt-get install -y ctags

vimrc: .vimrc 
	ln -fs $(CURDIR)/.vimrc ~/.vimrc

ctags: .ctags
	ln -fs $(CURDIR)/.ctags ~/.ctags

bundle:
	mkdir bundle

vundle: bundle
	cd $?
	@echo [ -d $@ ] || git clone https://github.com/gmarik/vundle.git
	@cd $?/$@ && git pull
