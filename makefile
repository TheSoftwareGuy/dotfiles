.PHONY: links
links:
	$(LN) ~/.bashrc bashrc
	$(LN) ~/.profile profile
	$(LN) ~/.vimrc .vim/.vimrc
	$(LN) -s ~/.vim .vim
	$(LN) -s ~/.nvim
	$(LN) ../.nvimrc nvim/nvimrc



