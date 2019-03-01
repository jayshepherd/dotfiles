set encoding=utf-8

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
syntax on
syntax enable
filetype on
filetype plugin indent on
set background=dark
colorscheme gruvbox

if has("gui_running")  
  set guifont=Panic\ Sans-Powerline:h13
else
end

map = :bnext<CR>
map - :bprevious<CR>

map ` <Esc>

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

let g:Powerline_symbols = 'fancy'

set clipboard=unnamed

command! W :w

let mapleader = ","

" Start NERDTree automatically
autocmd VimEnter * NERDTree | wincmd p
" Close NERDTree if only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F2> :NERDTreeFocus<CR>

set ruler
set hidden

set cmdheight=2
set showcmd
set noea
set number

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2

set backspace=indent,eol,start

set hlsearch
set incsearch
set viminfo='20,<50,s10,h,%
set wildmenu
set wildmode=list:longest,full

set ignorecase
set smartcase

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set history=1000
set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
set tabline=2
set cursorline
hi CursorLine guifg=NONE guibg=#e0e0e0 gui=NONE 

set shell=/bin/sh

" Make viewport navigation nicer
map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-H> <C-w>h
map <C-L> <C-w>l

set splitbelow
set splitright

nnoremap <leader>. :CtrlPTag<cr>
nmap <leader>rh :%s/\v:(\w+) \=\>/\1:/g<cr>

vnoremap <silent> <Leader>A :Tab /:\zs<CR>
vnoremap <silent> <Leader>a :Tab /=<CR>

set shortmess+=A
set backupskip=/tmp/*,/private/tmp/*

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
