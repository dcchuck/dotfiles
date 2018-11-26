"""""""""""""""""""""""""""""""""
"                               "
" Plugins                       "
"                               "
"""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

  Plug 'christoomey/vim-tmux-navigator'

  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'

  Plug 'jiangmiao/auto-pairs'

  Plug 'ervandew/supertab'
  Plug 'ctrlpvim/ctrlp.vim'

  Plug 'albertorestifo/github.vim'

  Plug 'dcchuck/tabline.vim'

  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'Quramy/tsuquyomi', { 'for': 'typescript'  }

  Plug 'elzr/vim-json'
  Plug 'alvan/vim-closetag'

  " Track the engine.
  Plug 'SirVer/ultisnips'

  " Snippets are separated from the engine. Add this if you want them:
  Plug 'honza/vim-snippets'

  "" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"

  " If you want :UltiSnipsEdit to split your window.
  " let g:UltiSnipsEditSplit="vertical"
  " "

call plug#end()

" leafgarland/typescript-vim
" disable default indentation settings
" let g:typescript_indent_disable = 1

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0


"""""""""""""""""""""""""""""""""
"                               "
" Visuals                       "
"                               "
"""""""""""""""""""""""""""""""""
syntax enable
set number relativenumber
colorscheme github
set colorcolumn=81
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set backspace=2

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set list listchars=trail:~,tab:·»,


"""""""""""""""""""""""""""""""""
"                               "
" Insert Mode Remaps            "
"                               "
"""""""""""""""""""""""""""""""""
imap jk <esc>
imap kj <esc>


"""""""""""""""""""""""""""""""""
"                               "
" Leader Mappings               "
"                               "
"""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
nmap <leader>h :nohlsearch<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>W :wq<cr>
nmap <leader>Q :qa<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>T :! npx tsc --project .<cr>

nmap <expr> <leader> nr2char(getchar()).'gt'


"""""""""""""""""""""""""""""""""
"                               "
" Status Line                   "
"                               "
"""""""""""""""""""""""""""""""""
set laststatus=2
" File file path, help & read only flags
set statusline=%F%h%r
" Modifier flag with custom highlight group
set statusline+=%1*%m%*
hi User1 ctermfg=15 ctermbg=160

" Split Statusline - left and right justified
set statusline+=%=

" Column,line/Lines
set statusline+=%c,%l/%L

hi StatusLine ctermfg=34 ctermbg=15
au insertenter * hi StatusLine ctermfg=160 ctermbg=15
au insertleave * hi StatusLine ctermfg=34 ctermbg=15


"""""""""""""""""""""""""""""""""
"                               "
" Convenience                   "
"                               "
"""""""""""""""""""""""""""""""""

nmap <leader>C i//tslint:disable-next-line:no-console<esc>
