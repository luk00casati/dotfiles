set nocompatible

syntax on

filetype plugin on

set relativenumber
set number

set cursorline

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set backspace=indent,eol,start

set scrolloff=10

set nowrap

set incsearch
set ignorecase
set smartcase
set hlsearch

set showcmd
set showmode

set wildmenu
set termguicolors

set autoindent
filetype indent on

call plug#begin()

Plug 'morhetz/gruvbox'

call plug#end()

set bg=dark
colorscheme gruvbox

set encoding=utf-8

set nobackup
set nowritebackup

set updatetime=300
set signcolumn=yes
set nofoldenable
