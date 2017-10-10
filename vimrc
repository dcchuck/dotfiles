call plug#begin('~/.vim/plugged')

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-endwise'
  Plug 'flazz/vim-colorschemes'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'dcchuck/tabline.vim'
  Plug 'vim-syntastic/syntastic'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ervandew/supertab'
  Plug 'leafgarland/typescript-vim'
  Plug 'Valloric/YouCompleteMe'
  Plug 'vim-utils/vim-line'

call plug#end()

syntax enable
set t_Co=256
colorscheme PaperColor

" Search highlighting and toggle off
set hlsearch

set relativenumber
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set clipboard=unnamed
set colorcolumn=141

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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args = '--config ~/dotfiles/configs/.jshintrc'
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_typescript_tslint_args = "--config ~/dotfiles/configs/tslint.json"

"Spellcheck in markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

" Tabe complete with dictionary words when spell check is on
set complete+=kspell
autocmd BufRead,BufNewFile *.md imap <Tab> <C-P>
autocmd BufRead,BufNewFile *.md setlocal spell

"Leader Mappings
nmap <expr> <leader> nr2char(getchar()).'gt'
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>h :nohlsearch<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>W :wq<cr>
nmap <leader>Q :qa<cr>
nmap <leader>S :SyntasticReset<cr>
nmap <leader>H :SyntasticToggleMode<cr>
nmap <leader>' cs"'
