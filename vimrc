" ------------------------------------------------------------------------------
" Pathogen
" ------------------------------------------------------------------------------
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" ------------------------------------------------------------------------------
" General
" ------------------------------------------------------------------------------
" Disable the reading of .vimrc, .exrc and .gvimrc in the current directory.
set noexrc  

" Detect filetypes
filetype on
filetype plugin on 

" Always show command or insert mode
" If in Insert, Replace or Visual mode put a message on the last line.
set showmode

" Not compatible with 'vi', required for using eclim
set nocp


" ------------------------------------------------------------------------------
" Sounds
" ------------------------------------------------------------------------------
set noerrorbells  " No annoying error beep noise
set novisualbell
set t_vb=         " When no beep or flash is wanted, use ':set vb t_vb='.


" ------------------------------------------------------------------------------
" Vim UI
" ------------------------------------------------------------------------------
set mh  " Hide the mouse when typing

set nocursorcolumn
set nocursorline

set number          " Line Numbers
set numberwidth=4   " Width of line numbers
set ruler
set showmatch       " Show matching brackets
set matchtime=3     " ... for 3 tenths of a second

set linespace=0     " No extra pixel space between rows
set foldmethod=manual
set laststatus=2    " Always show the statusline
set cmdheight=2     " Make the command area two lines high

set encoding=utf-8



" ------------------------------------------------------------------------------
" Text formatting / Syntax
" ------------------------------------------------------------------------------
set ai      " Automatically indent new lines


set expandtab     " Tabs to spaces
set tabstop=2     " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=2  " Number of spaces to use for each step of (auto)indent.
set softtabstop=2 " Number of spaces that a <Tab> counts for while performing 
                  " editing operations, like inserting a <Tab> or using <BS>.  



" ------------------------------------------------------------------------------
" Theme
" ------------------------------------------------------------------------------
syntax enable
set background=dark
colorscheme solarized

if exists('+colorcolumn')
  set colorcolumn=80  " Color the 80th column differently
  hi! ColorColumn ctermbg=9
endif



" ------------------------------------------------------------------------------
" Drupal files highlighting
" ------------------------------------------------------------------------------
if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif



" ------------------------------------------------------------------------------
" Snipmate
" ------------------------------------------------------------------------------
let g:snipMate = {}
let g:snipMate.scope_aliases = {} 
let g:snipMate.scope_aliases['php'] = 'php,tpl.php'
