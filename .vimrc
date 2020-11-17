set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'valloric/youcompleteme'
" Plugin 'dense-analysis/ale'

" All of your Plugins must be added before the following line
" call vundle#end()            " required
filetype plugin indent on    " required

"maps split switching
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

nnoremap <C->> <C-W>>

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

"autocompletes parens and bracks with tab inbetween


"switch line start and end
nnoremap B ^
nnoremap E $

"esc remap
imap jj <Esc>

autocmd FileType tex set shiftwidth=4 tabstop=4
autocmd FileType tex set autoindent
autocmd FileType tex set smartindent

autocmd FileType py set shiftwidth=4 tabstop=4
autocmd FileType py set autoindent
autocmd FileType py set smartindent
autocmd FileType py set textwidth=79 " PEP-8 Friendly

autocmd FileType sql set shiftwidth=2 tabstop=2

syntax on 
set showmatch "matches parens etc
set encoding=utf-8


set splitbelow
set splitright
set nu
"set nonu

set clipboard=unnamedplus

autocmd BufWinLeave *.* mkview "auto saves views for folds
autocmd BufWinEnter *.* silent loadview  "auto loads views for folds


color desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40


