execute pathogen#infect()

set background=dark
colorscheme gruvbox

syntax on
filetype plugin indent on

" Automatically read when a file is changed outside of Vim
set autoread

" Enable modelines
set modeline
set modelines=5

" Use XA_PRIMARY clipboard by default
set clipboard=unnamed

" Python stuff
au BufNewFile,BufRead *.py " Set up nice PEP8 indentation
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix

" Miscellaneous options
set incsearch " Search while you type
set number relativenumber " Relative line numbering
set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1

" Enable 256-color support
" All of my machines support 256-color so this should be fine
set t_Co=256
