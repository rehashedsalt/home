execute pathogen#infect()

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='medium'

syntax on
filetype plugin indent on

" Automatically read when a file is changed outside of Vim
set autoread

" Use XA_PRIMARY clipboard by default
set clipboard=unnamed

" Enable line numbering
set number
set relativenumber

" Enable 256-color support
" All of my machines support 256-color so this should be fine
set t_Co=256
