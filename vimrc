call plug#begin('~/.vim/plugged')

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-endwise'
  Plug 'flazz/vim-colorschemes'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'kchmck/vim-coffee-script'
  Plug 'digitaltoad/vim-pug'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'ervandew/supertab'
  Plug 'dcchuck/tabline.vim'

call plug#end()

syntax enable
set t_Co=256
colorscheme PaperColor

" Search highlighting and toggle off
set hlsearch

set number
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set clipboard=unnamed
set colorcolumn=81

" new splits open by default underneath or to the right
set splitbelow
set splitright

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END

augroup CursorColumnOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
	autocmd WinLeave * setlocal nocursorcolumn
augroup END

let mapleader = "\<Space>"

imap jk <esc>
imap kj <esc>

set backspace=2

au BufNewFile,BufRead *.ejs set filetype=html

"Leader Mappings
nmap <expr> <leader> nr2char(getchar()).'gt'
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>h :nohlsearch<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>W :wq<cr>
nmap <leader>Q :qa<cr>

set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%r%y
set statusline+=%1*
set statusline+=%m
set statusline+=%*
set statusline+=%=%c,%l/%L\ %P

hi User1 ctermfg=white ctermbg=red
au insertenter * hi StatusLine ctermfg=white ctermbg=red
au insertleave * hi StatusLine ctermfg=254 ctermbg=24

" Configure tabline color scheme
hi TabLine ctermfg=24 ctermbg=36
hi TabLineFill ctermbg=36
hi TabLineSel ctermfg=24 ctermbg=255 cterm=bold
