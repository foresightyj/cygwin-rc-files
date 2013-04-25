" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

syntax on
set showmode
set visualbell
"set autoindent
set smartindent
set incsearch
color desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

filetype off

call pathogen#infect()
call pathogen#helptags()

" execute pathogen#infect()
filetype plugin indent on

let mapleader = ","


set number
set hlsearch

nnoremap <silent> <F12> :NERDTreeToggle<CR>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-o> <C-w>o

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

nnoremap <F4> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
inoremap <F4> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" To save, press ctrl-s.
inoremap <c-s> <Esc>:Update<CR>

"use jk as <esc> in insert mode
inoremap jk <esc>

" Up and Down arrow keys to go up or down horizontal windows
noremap <Up> <c-w>k
noremap <Down> <c-w>j

au BufAdd,BufNewFile * nested tab sball

" right arrow key to switch between tabs
noremap <Right> :tabn<cr>
noremap <Left> :tabp<cr>

" make tabs more obvious
hi TabLineFill ctermfg=Black ctermbg=Black
hi TabLine ctermfg=Black ctermbg=White
hi TabLineSel ctermfg=White ctermbg=DarkGreen

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>j

nnoremap <leader>as :%!astyle<cr>

autocmd FileType c map <F7> :!gcc GoGo%:p:r.out" "%:p" && "%:p:r.out"<CR>
autocmd BufNewFile,BufRead,BufWritePost *.c execute '!astyle %'
autocmd BufNewFile,BufRead,BufWritePost *.h execute '!astyle %'


