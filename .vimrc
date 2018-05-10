if &compatible
    set nocompatible
endif

call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim'

if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/denite.nvim'
Plug 'StanAngeloff/php.vim'
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ekalinin/Dockerfile.vim'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'rust-lang/rust.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'w0rp/ale'
Plug 'wellle/tmux-complete.vim'
Plug 'zchee/deoplete-jedi'

call plug#end()

filetype plugin indent on
syntax enable


" Ctrl-p via FZF
"
nnoremap <c-p> :Files <cr>


" Deoplete
"
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" ALE settings
"
let g:ale_linters = {
            \  'php': ['phpcs'],
            \  'python': ['flake8'],
            \  'rust': ['rls']
            \}


" Lightline settings
"
let g:lightline = {
            \ 'colorscheme': 'nord',
            \ }


" Rust
let g:rustfmt_autosave = 1


" Map a new leader.
let mapleader = ","

" Save when we lose focus.
au FocusLost * :silent! wall

" Dynamically resize splits.
au VimResized * :wincmd =

" General Vim config
set autoread
set autowrite
set backspace=indent,eol,start
set colorcolumn=79
set cursorline
set encoding=utf-8
set expandtab
set gdefault
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set noshowmode
set relativenumber
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set softtabstop=4
set tabstop=4
set undofile
set visualbell

" Make it so we can use the system clipboard.
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

inoremap <C-a> <esc>I
inoremap <C-e> <End>
noremap H ^
noremap L $

noremap vv :vsplit<CR>


colorscheme nord
