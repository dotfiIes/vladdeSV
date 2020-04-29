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

" switch panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ignore just a q press. h*ck i dislike this command...
"map q <Nop>

" ctrl+space (on mac) to autocomplete
inoremap <C-@> <C-N>

colorscheme garybernhardt

set laststatus=2
set statusline=
set statusline+=\ %l
set statusline+=\ %*
set statusline+=\ ‹‹
set statusline+=\ %f\ %*
set statusline+=\ ››
set statusline+=\ %m
set statusline+=\ %F
set statusline+=%=
set statusline+=\ ‹‹
set statusline+=\ ::
set statusline+=\ %n
set statusline+=\ ››\ %*

au BufRead,BufNewFile *.fish set filetype=fish
