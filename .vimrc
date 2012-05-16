set shell=/bin/bash

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'daveray/vimclojure-easy', {'rtp': 'bundle/vimclojure-2.3.1'}
Bundle 'shemerey/vim-peepopen'

Bundle 'railscasts'

Bundle 'ack.vim'
Bundle 'bufkill.vim'
Bundle 'ctrlp.vim'
Bundle 'pyflakes.vim'
Bundle 'bufexplorer.zip'

filetype indent on
filetype plugin indent on

colorscheme railscasts
syntax on

" general settings
set autoread
set autowrite
set backspace=indent,eol,start
set colorcolumn=79
set cursorline
set encoding=utf-8
set formatoptions+=qrn1
set hidden
set history=1000
set laststatus=2
set linebreak
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set modelines=0
set relativenumber
set ruler
set scrolloff=3
set shiftround
set showbreak=↪
set showmode
set showcmd
set textwidth=79
set title
set ttyfast
set undofile
set visualbell
set wildmenu
set wildmode=list:longest
set wrap

" tabs
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" status line
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

" backup and swap
set backup
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

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
noremap H ^
noremap L $

" encourage hjkl
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" buffer navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>w <C-w>v<C-w>l

" ack
nnoremap <leader>a :Ack!<space>

" ctrlp
let g:ctrlp_map = '<c-p>'
nmap <leader>p :CtrlP getcwd()<CR>
nmap <leader>b :CtrlP getcwd()<CR><c-b>

" vimclojure
let vimclojure#DynamicHighlighting = 1
let vimclojure#FuzzyIndent = 1
let vimclojure#ParenRainbow = 1
let vimclojure#HighlightBuiltins = 1
let vimclojure#HighlightContrib = 1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = $HOME . '/.vim/bundle/vimclojure-easy/lib/vimclojure-nailgun-client/ng'

" autosave on lost focus
au FocusLost * :silent! wall

" resize splits dynamically
au VimResized * :wincmd =

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

    " hilight for `bad spelling`
    hi SpellBad term=underline gui=undercurl guisp=Orange

    " railcasts theme hacks
    hi ColorColumn guibg=#333435
    hi LineNr guibg=#333435
    hi StatusLine guifg=#333435 guibg=fg
    hi StatusLineNC guifg=#333435 guibg=fg
    hi VertSplit guifg=#888888 guibg=#333435 gui=bold
else
    set nocursorline
endif
