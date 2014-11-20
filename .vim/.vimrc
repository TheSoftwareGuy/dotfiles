""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  variable settings                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " the first line in any decent .vimrc
set scrolloff=3
set shiftwidth=4
set tabstop=4
set hlsearch
set noexpandtab copyindent preserveindent softtabstop=0
set showmatch
set incsearch
set number
set relativenumber
syntax enable
set noswapfile

set timeout timeoutlen=1000 ttimeoutlen=100
set autoindent

set ignorecase
set smartcase
set showmatch

set wildmode=list:longest
set completeopt=longest,menu,preview
set wildmenu

if has('gui_running')
    colorscheme slate
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

nnoremap <leader>/ ^i//<ESC>
nnoremap <leader>q :wq<cr>
nnoremap <leader>w :w<cr>
nnoremap <c-e> $
nnoremap <c-a> ^


"Press space to clear search highlighting and eny message already displayed
nnoremap <leader><leader> :silent noh<Bar>echo<CR>

inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
imap <c-e> <ESC>$a
imap <c-a> <ESC>^a

vnoremap <F12> :'<,'>s/^\(.*?\)//<left>

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
