set shell=/bin/bash

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'railscasts'
Bundle 'VimClojure'
Bundle 'ack.vim'
Bundle 'bufkill.vim'
Bundle 'ctrlp.vim'
Bundle 'pyflakes.vim'
Bundle 'bufexplorer.zip'

filetype plugin indent on

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

set modelines=0

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
set laststatus=2

" backup and swap
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup

" color
set t_Co=256

" custom leader
let mapleader = ","

" search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
map <leader><space> :noh<cr>
nmap <tab> %
vmap <tab> %

" sane line navigation ;)
inoremap <C-a> <esc>I
inoremap <C-e> <End>

" wrapping
set wrap
set textwidth=79

" use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,eol:¬

" encourage hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" buffer navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>w <C-w>v<C-w>l

" ack
map <leader>a :Ack 

" ctrlp
let g:ctrlp_map = '<c-p>'

" vimclojure
let vimclojure#NailgunClient = '/usr/local/bin/ng-server'
let vimclojure#ParenRainbow = 1
let vimclojure#HighlightBuiltins = 1
let vimclojure#HighlightContrib = 1

" autosave on lost focus
au FocusLost * :wa!

" hilight for `bad spelling`
hi SpellBad term=underline gui=undercurl guisp=Orange

syntax on
colorscheme railscasts
set colorcolumn=79

" GUI-specific
if has('gui_running')
    set guifont=Inconsolata:h18
    colorscheme railscasts
    set transparency=15

    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    " railcasts theme hacks
    hi ColorColumn guibg=#333435
    hi LineNr guibg=#333435
    hi StatusLine guifg=#333435 guibg=fg
    hi StatusLineNC guifg=#333435 guibg=fg
    hi VertSplit guifg=#888888 guibg=#333435 gui=bold
else
    set nocursorline
endif
