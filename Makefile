all: bundle vimrc ctags
	vim  +PluginInstall +qall! -u ~/.vim/plugins
	brew install the_silver_searcher
	brew install cmake
	cd ~/.vim/bundle/YouCompleteMe && ./install.py --tern-completer
	npm install -g jshint
	npm install -g jscs

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
