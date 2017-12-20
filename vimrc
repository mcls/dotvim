﻿" ------------------------------------------------------------------------------
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

set autoread

" two path separators '//' will ensure file name uniqueness in the preserve
" directory
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//

" number of entered command-lines remembered in a history table
set history=10000

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=


" Configure tab completion
set wildmode=longest,list,full
set wildmenu

set synmaxcol=340

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

syntax on

" Got laggy vim when using ruby syntax highlighting after I updated to El
" Capitan, using the old regiex engine fixes it...
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting/16920294#16920294
set re=1 " Use the old regex engine

set ai        " Automatically indent new lines
set mouse=a
set smartcase

set expandtab     " Tabs to spaces
set tabstop=2     " Number of spaces that a <Tab> in the file counts for.
set softtabstop=2 " Number of spaces that a <Tab> counts for while performing
                  " editing operations, like inserting a <Tab> or using <BS>.
set shiftwidth=2  " Number of spaces to use for each step of (auto)indent.

set backspace=indent,eol,start

autocmd BufRead,BufNewFile *.slim set filetype=slim
autocmd Filetype slim setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype go setlocal ts=4 sts=4 sw=4 noexpandtab nolist

" Prevents 'crontab: temp file must be edited in place' error on OS X
" See http://calebthompson.io/crontab-and-vim-sitting-in-a-tree/
autocmd Filetype crontab setlocal nobackup nowritebackup

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
autocmd FileType rdoc,markdown,yaml let b:noStripWhitespace=1


" ------------------------------------------------------------------------------
" Theme
" ------------------------------------------------------------------------------

" Try to ensure terminal uses 256 colors
set term=xterm-256color
set t_Co=256

" If you do use the custom terminal colors, solarized.vim should work out of the
" box for you. If you are using a terminal emulator that supports 256 colors and
" don’t want to use the custom Solarized terminal colors, you will need to use
" the degraded 256 colorscheme. To do so, simply add the following line before
" the colorscheme solarized line:
" let g:solarized_termcolors=256

" set background=dark
colorscheme solarized

" Color the 80th column differently
if exists('+colorcolumn')
  set colorcolumn=80
  " hi! ColorColumn ctermbg=187
  hi! ColorColumn ctermbg=0
endif

set cursorline
" Uncomment next lines for further customization
" hi CursorLine cterm=NONE ctermbg=8 guibg=8
" hi CursorLineNr cterm=bold ctermfg=7 ctermbg=9 guibg=9



" ------------------------------------------------------------------------------
" Markdown, rdoc filetype
" ------------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.markdown set filetype=markdown
autocmd BufRead,BufNewFile *.md,*.markdown setlocal textwidth=80
autocmd BufRead,BufNewFile *.rdoc set filetype=rdoc


" ------------------------------------------------------------------------------
" Snipmate
" ------------------------------------------------------------------------------
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['php'] = 'php,tpl.php'



" ------------------------------------------------------------------------------
" Go (vim-go)
" ------------------------------------------------------------------------------
" Enable goimports to automatically insert import paths instead of gofmt:
let g:go_fmt_command = "goimports"



" ------------------------------------------------------------------------------
" Keys & Commands
" ------------------------------------------------------------------------------
" Use <space> as the leader key. I used to use ',' but it conflicts with a
" movement command I want to use (see :help ,)
let mapleader = " "
" let mapleader = ","

" Prevent entering Ex mode
" ( Entering Ex mode.  Type 'visual' to go to Normal mode.)
" http://www.bestofvim.com/tip/leave-ex-mode-good/
noremap Q <nop>

" Remap semicolon to colon, handy on qwerty
map ; :
" To get the original ';' behavior, just hit it twice
" More info: http://vim.wikia.com/wiki/Map_semicolon_to_colon
noremap ;; ;

" Sort all words on a line
command SortWords call setline('.', join(sort(split(getline('.'), ' ')), " "))

" ------------------------------------------------------------------------------
" Etcetera
" ------------------------------------------------------------------------------
" This is the easiest way to get ruby and rvm working in vim when using zsh
" https://rvm.io/integration/vim/
set shell=/bin/sh

autocmd BufRead,BufNewFile *.gradle set filetype=groovy


" Use % to navigate `do ... end` blocks in ruby
" http://stackoverflow.com/questions/3413189/vim-highlight-keyword-pairs-in-ruby-def-end-do-end-etc
if version >= 703
  runtime macros/matchit.vim
end

" This fixes issues with tmux and the background color
" Running :set t_ut= to disables 'Background Color Erase'.
"
" http://sunaku.github.io/vim-256color-bce.html
" http://superuser.com/questions/559041/vim-backgroundcolor-in-tmux-how-to-force-zsh-to-use-screen-instead-of-xterm-in
if &term =~ '256color'
  set t_ut=
end

set spell spelllang=en_us

" Heredoc syntax highlighting rules
" See: https://github.com/joker1007/vim-ruby-heredoc-syntax
let g:ruby_heredoc_syntax_filetypes = {
      \ "graphql" : {
      \   "start" : "GRAPHQL",
      \},
      \}

" RSpec.vim mappings
" https://github.com/thoughtbot/vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
