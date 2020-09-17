set number
set relativenumber
set smartcase
set scrolloff=3
set numberwidth=4
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set scrolloff=3

" statusline
set laststatus=2
set statusline=
set statusline+=\ [%l,%c]
set statusline+=\ %F

" preferred behaviour
nnoremap d "_d
vnoremap d "_d

" ignore just a q press. h*ck i dislike this command...
map q <Nop>

" ctrl+space (on mac) to autocomplete
inoremap <C-@> <C-N>

" recognize .fish files
au BufRead,BufNewFile *.fish set filetype=fish

colorscheme garybernhardt
