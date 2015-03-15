all: bundle vimrc ctags
	vim  +PluginInstall +qall! -u ~/.vim/plugins
	sudo apt-get install -y ctags
	sudo apt-get install silversearcher-ag

vimrc: .vimrc 
	ln -fs $(CURDIR)/.vimrc ~/.vimrc

ctags: .ctags
	ln -fs $(CURDIR)/.ctags ~/.ctags

bundle:
	mkdir bundle
	cd bundle && git clone https://github.com/gmarik/vundle.git

clean: 
	rm -rf bundle

.PHONY: clean ctags vimrc all vundle
