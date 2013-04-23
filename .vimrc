syntax on
set autoindent
colorscheme desert

filetype off

call pathogen#infect()
call pathogen#helptags()

" execute pathogen#infect()
syntax on
filetype plugin indent on

" Load run code plugin
" let g:pymode_run = 1
"
" " Key for run python code
" let g:pymode_run_key = '<leader>r'
"

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

:imap <c-d> <esc>ddi

let mapleader = ","


