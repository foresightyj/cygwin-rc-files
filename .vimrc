" Use Vim settings, rather then Vi settings (much better!).
set nocompatible
set background=dark

set showmode
set visualbell
set autoindent
set incsearch

if has("gui_running")
	colorscheme desert
else
	colorscheme darkblue
endif

set cursorline
highlight CursorLine term=bold cterm=bold guibg=Grey40

filetype off

call pathogen#infect()
call pathogen#helptags()

" execute pathogen#infect()
filetype plugin indent on
syntax on

let mapleader = ","

" disable dup checks will significantly speed up vim
let g:miniBufExplCheckDupeBufs = 0
map <Leader>m :MiniBufExplorer<cr>

set number
set hlsearch

let g:NERDTreeWinPos = "left"
nnoremap <silent> <F12> :NERDTreeToggle<CR>

set winminheight=0      " Allow windows to get fully squashed

" Switch between windows, maximizing the current window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>o <C-w>o

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\  " buffer number
set statusline+=%f\  " filename
set statusline+=%h%m%r%w  " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=  " right align remainder
set statusline+=0x%-8B  " character value
set statusline+=%-14(%l,%c%V%)  " line, character
set statusline+=%<%P  " file position
" Show line number, cursor position.
set ruler
" Display incomplete commands.
set showcmd

" nnoremap <F4> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
" inoremap <F4> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" To save, press ctrl-s.
inoremap <C-s> <esc>:w<cr>

"use jk as <esc> in insert mode
inoremap jk <esc>

" Up and Down arrow keys to go up or down horizontal windows
noremap <Up> <c-w>k
noremap <Down> <c-w>j

" autocmd BufAdd,BufNewFile * nested tab sball

" right arrow key to switch between tabs
noremap <Right> :bn<cr>
noremap <Left> :bp<cr>

noremap <leader>d :bd<cr>
noremap <leader>q :q<cr>
noremap <leader>w :w<cr>

" make tabs more obvious
highlight TabLineFill ctermfg=Black ctermbg=Black
highlight TabLine ctermfg=Black ctermbg=White
highlight TabLineSel ctermfg=White ctermbg=DarkGreen

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

nnoremap <leader>as :%!astyle<cr>

autocmd FileType c map <F7> :!gcc GoGo%:p:r.out" "%:p" && "%:p:r.out"<CR>
" autocmd BufNewFile,BufRead,BufWritePost *.c execute '!astyle %'
" autocmd BufNewFile,BufRead,BufWritePost *.h execute '!astyle %'
autocmd BufWritePre *.{c,h} :normal gg=G

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4


let maplocalleader = "\\"

autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>

" automatically insert the Python header to a newly created Python file
au BufEnter *.py if getline(1) == "" | call pythonHeader#PythonHeader() | endif
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

au BufEnter .vimrc call rmLeadingColon#RmLeadingColon()
