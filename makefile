.PHONY: links

LN :=ln

links:
	$(LN) bashrc ~/.bashrc 
	$(LN) profile  ~/.profile 
	$(LN) .vim/.vimrc ~/.vimrc 
	$(LN) -s .vim ~/.vim 
	$(LN) -s nvim ~/.nvim
	$(LN) nvim/nvimrc ~/.nvimrc 



