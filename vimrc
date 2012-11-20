" ------------------------------------------------------------------------------
" Pathogen
" ------------------------------------------------------------------------------
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" ------------------------------------------------------------------------------
" General
" ------------------------------------------------------------------------------

set encoding=utf-8

" Disable the reading of .vimrc, .exrc and .gvimrc in the current directory.
set noexrc

" Detect filetypes
filetype on
filetype plugin on
filetype indent on

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




" ------------------------------------------------------------------------------
" Text formatting / Syntax
" ------------------------------------------------------------------------------
set ai      " Automatically indent new lines


set expandtab     " Tabs to spaces
set tabstop=2     " Number of spaces that a <Tab> in the file counts for.
set softtabstop=2 " Number of spaces that a <Tab> counts for while performing
                  " editing operations, like inserting a <Tab> or using <BS>.
set shiftwidth=2  " Number of spaces to use for each step of (auto)indent.

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd Filetype css,scss setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd Filetype html,xhtml setlocal ts=2 sts=2 sw=2 noexpandtab

" Show invisible characters
set list
set listchars=tab:>-,trail:~,nbsp:.,precedes:<,extends:>

" Automatically remove trailing whitespace on save
fun! StripTrailingWhitespace()
  " Only strip if the b:noStripeWhitespace variable isn't set
  if exists('b:noStripWhitespace')
    return
  endif
  %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType rdoc,markdown let b:noStripWhitespace=1



" ------------------------------------------------------------------------------
" Theme
" ------------------------------------------------------------------------------
syntax enable
set background=dark
" If you do use the custom terminal colors, solarized.vim should work out of the
" box for you. If you are using a terminal emulator that supports 256 colors and
" don’t want to use the custom Solarized terminal colors, you will need to use
" the degraded 256 colorscheme. To do so, simply add the following line before
" the colorschem solarized line:
" let g:solarized_termcolors=256
colorscheme solarized

if exists('+colorcolumn')
  set colorcolumn=80  " Color the 80th column differently
  hi! ColorColumn ctermbg=9
endif



" ------------------------------------------------------------------------------
" Markdown, rdoc filetype
" ------------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.markdown set filetype=markdown
autocmd BufRead,BufNewFile *.rdoc set filetype=rdoc




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



" ------------------------------------------------------------------------------
" Keys
" ------------------------------------------------------------------------------
let mapleader = ","
