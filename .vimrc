set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

call vundle#end()
filetype plugin indent on


"escape and save remap
imap lj <Esc>
nnoremap sf :update<cr>
nnoremap ou :q<cr>
nnoremap :T :ter<cr>
nnoremap :E :edit!<cr>

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


autocmd FileType tex set shiftwidth=4 tabstop=4
autocmd FileType tex set autoindent
autocmd FileType tex set smartindent

autocmd FileType py || go set shiftwidth=4 tabstop=4
autocmd FileType py || go set autoindent
autocmd FileType py || go set smartindent
autocmd FileType py || go set textwidth=79 " PEP-8 Friendly

autocmd FileType sql set shiftwidth=2 tabstop=2

autocmd FileType txt set spell
autocmd FileType txt set spelllang=en_us
autocmd FileType txt set shiftwidth=4 tabstop=4
autocmd FileType txt set autoindent
autocmd FileType txt set smartindent

syntax on 
set showmatch "matches parens etc
set encoding=utf-8

set splitbelow
set splitright
set nu rnu

set clipboard=unnamedplus

autocmd BufWinLeave *.* mkview "auto saves views for folds
autocmd BufWinEnter *.* silent loadview  "auto loads views for folds

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40


