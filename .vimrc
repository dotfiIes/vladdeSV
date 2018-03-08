set nocompatible
filetype off

syntax enable
set ruler
set autoindent
set backspace=indent,eol,start
set cursorline
set noerrorbells
set ttyfast
set hlsearch
set ignorecase
set smartcase
set incsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set numberwidth=4
set nowrap

" ignore just a q press. h*ck i dislike this command...
map q <Nop>
" switch panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" show suggestions
imap <Tab> <C-P>

colorscheme monokai
