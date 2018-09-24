all: fzf python3 ack haskell-ide vim-plug
    nvim +PlugInstall +UpdateRemotePlugins +qa

vim-plug:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

fzf:
	brew install fzf

python3:
	brew install python
	pip3 install neovim

ack:
	brew install ack

haskell-ide:
	git clone https://github.com/haskell/haskell-ide-engine && cd haskell-ide-engine
	stack --stack-yaml=stack-8.4.2.yaml install

.PHONY: all vim-plug fzf python3 ack haskell-ide
