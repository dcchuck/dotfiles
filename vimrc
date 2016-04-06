call plug#begin('~/.vim/plugged')

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'altercation/vim-colors-solarized'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'kchmck/vim-coffee-script'
  Plug 'digitaltoad/vim-pug'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'ervandew/supertab'
  
call plug#end()

syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized

set number
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set clipboard=unnamed
set colorcolumn=81

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

"set laststatus=2

set colorcolumn=81

augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END

let mapleader = "\<Space>"

nmap <leader>so :source $MYVIMRC<cr>

imap jk <esc>
imap kj <esc>

set backspace=2
