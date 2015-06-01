""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  variable settings                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " the first line in any decent .vimrc
set scrolloff=3
set shiftwidth=2
set tabstop=2
set hlsearch
set expandtab copyindent preserveindent softtabstop=0
set showmatch
set incsearch
set number
set relativenumber
syntax enable
" set noswapfile " I am trying this temporarily

set timeout timeoutlen=1000 ttimeoutlen=100
set autoindent

set ignorecase
set smartcase
set showmatch

set wildmode=list:longest
set completeopt=longest,menu,preview
set wildmenu

"for Vundle
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"            YouCompleteMe Configuration               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_seed_identifiers_with_syntax =1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files = 1

nnoremap <leader>jt :YcmCompleter GoTo
nnoremap <leader>jd :YcmCompleter GoToDeclaration
nnoremap <leader>gt :YcmCompleter GetType
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"            Vim-Airline Configuration                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
set laststatus=2



if has('gui_running')
    colorscheme darkblue
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"              Key mappings                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "

"easily switch between buffers
nnoremap <c-j> <c-w>j 
nnoremap <c-k> <c-w>k 
nnoremap <c-h> <c-w>h 
nnoremap <c-l> <c-w>l 
nnoremap <c-n> :bn    
nnoremap <c-p> :bp    

" insert a C++ style single-line comment
nnoremap <leader>/ mT^i//<ESC>`T 

"""""""""
" Folds "
"""""""""
nnoremap <leader>{ zfa{


"Press space to clear search highlighting and eny message already displayed
nnoremap <leader><leader> :silent noh<Bar>echo<CR>

inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
imap <c-e> <ESC>$a
imap <c-a> <ESC>^a

vnoremap <C-F12> :'<,'>s/^\(.*?\)//<left>

" insert tabs the RIGHT way
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"    
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" once again, easier navigation
cmap <c-k> <up>
cmap <c-j> <down>
cmap <c-h> <left>
cmap <c-l> <right>
