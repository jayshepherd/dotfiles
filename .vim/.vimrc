call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
syntax on
syntax enable
filetype on
filetype plugin indent on
set background=dark
if has("gui_running")  
  set transparency=20
  colorscheme vividchalk
else
  colorscheme vividchalk
end

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

set clipboard=unnamed
autocmd FileType ruby map <C-F9> :w<CR>:!ruby -c %<CR>

command! W :w

let mapleader = ","

nmap <silent> <c-n> :NERDTreeToggle<CR>

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
":hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
set tabline=2
"set cursorline
"hi CursorLine guifg=NONE guibg=#e0e0e0 gui=NONE 
"ctermfg=NONE ctermbg=NONE cterm=NONE
:set guifont=DejaVu\ Sans\ Mono:h13

set shell=/bin/sh

" Make viewport navigation nicer
map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-H> <C-w>h
map <C-L> <C-w>l

"map <C-J> <C-w>j<C-w>_
"map <C-K> <C-w>k<C-w>_
"map <C-H> <C-w>h<C-w>\|
"map <C-L> <C-w>l<C-w>\|

" Make opening files in a new tab nicer
"map <C-O> :tabnew 

command! -nargs=? -range Align <line1>,<line2>call AlignSection('<args>')
vnoremap <silent> <Leader>a :Align<CR>
function! AlignSection(regex) range
  let extra = 1
  let sep = empty(a:regex) ? '=' : a:regex
  let maxpos = 0
  let section = getline(a:firstline, a:lastline)
  for line in section
    let pos = match(line, ' *'.sep)
    if maxpos < pos
      let maxpos = pos
    endif
  endfor
  call map(section, 'AlignLine(v:val, sep, maxpos, extra)')
  call setline(a:firstline, section)
endfunction

function! AlignLine(line, sep, maxpos, extra)
  let m = matchlist(a:line, '\(.\{-}\) \{-}\('.a:sep.'.*\)')
  if empty(m)
    return a:line
  endif
  let spaces = repeat(' ', a:maxpos - strlen(m[1]) + a:extra)
  return m[1] . spaces . m[2]
endfunction

