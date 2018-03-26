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
set autoread
set re=1
set timeout timeoutlen=1000 ttimeoutlen=100
set history=9001
set encoding=utf-8

" Windoes Subsysten for Linux (WSL) support
set term=screen-256color
set t_ut=

" ignore just a q press. h*ck i dislike this command...
map q <Nop>
" switch panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ctrl+space (on mac) to autocomplete
inoremap <C-@> <C-P>

"super-paste thing
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

colorscheme monokai
