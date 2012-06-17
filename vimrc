call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Disable the reading of .vimrc, .exrc and .gvimrc in the current	directory.
set noexrc

" Automatically indent new lines
set ai	

" Syntax highlighting on
syntax on

" No annoying error beep noise
set noerrorbells

" Detect filetypes
filetype on
filetype plugin on 

" Always show command or insert mode
set showmode

" Not compatible with 'vi', required for using eclim
set nocp

" Vim UI
set nocursorcolumn
set nocursorline
set linespace=0 	" No extra pixel space between rows
set number			  " Line Numbers
set numberwidth=5	" Width of line numbers
set ruler
set showmatch		  " Show matching brackets
set matchtime=5		" ... for 5 tenths of a second
set foldmethod=manual

" Text formatting/layout
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Drupal files highlighting
if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif

" Syntax Highlighting
" - sass
au BufRead,BufNewFile *.scss set filetype=scss
" - scala
au BufRead,BufNewFile *.scala set filetype=scala
au! Syntax scala source ~/.vim/syntax/scala.vim
