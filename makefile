.PHONY: links

LN :=ln
OUTPUT_DIR =~

links:
	$(LN) -s ~/.bashrc bashrc 
	$(LN) -s ~/.profile profile 
	$(LN) -s ~/.vimrc .vim/.vimrc 
	$(LN) -s ~/.vim .vim 
	$(LN) -s ~/.nvim nvim 
	$(LN) -s ~/.nvimrc nvim/nvimrc



