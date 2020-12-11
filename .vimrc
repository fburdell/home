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


"escape and save remap
imap jl <Esc>
nnoremap fs :update<cr>

"maps split switching
nnoremap <C->> <C-W>>
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

"switch line start and end
nnoremap B ^
nnoremap E $

"autocompletes parens and bracks with tab inbetween
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

autocmd FileType tex set shiftwidth=4 tabstop=4
autocmd FileType tex set autoindent
autocmd FileType tex set smartindent

autocmd FileType py || go set shiftwidth=4 tabstop=4
autocmd FileType py set autoindent
autocmd FileType py set smartindent
autocmd FileType py set textwidth=79 " PEP-8 Friendly

autocmd FileType sql set shiftwidth=2 tabstop=2

syntax on 
set showmatch "matches parens etc
set encoding=utf-8

set spell
set spelllang=en_us
set splitbelow
set splitright
set nu rnu

set clipboard=unnamedplus

autocmd BufWinLeave *.* mkview "auto saves views for folds
autocmd BufWinEnter *.* silent loadview  "auto loads views for folds

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40


