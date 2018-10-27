"""""""""""""""""""""""""""""""""
"																"
"	Plugins												"
"																"
"""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

  Plug 'christoomey/vim-tmux-navigator'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'

	Plug 'jiangmiao/auto-pairs'

	Plug 'ervandew/supertab'
  Plug 'ctrlpvim/ctrlp.vim'

	Plug 'albertorestifo/github.vim'

  Plug 'dcchuck/tabline.vim'

  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
	Plug 'Quramy/tsuquyomi', { 'for': 'typescript'  }

  Plug 'elzr/vim-json'
	Plug 'alvan/vim-closetag'

call plug#end()


"""""""""""""""""""""""""""""""""
"																"
"	Plugin Settings 							"
"																"
"""""""""""""""""""""""""""""""""
" leafgarland/typescript-vim
" disable default indentation settings
" let g:typescript_indent_disable = 1

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0


"""""""""""""""""""""""""""""""""
"																"
"	Visuals					 							"
"																"
"""""""""""""""""""""""""""""""""
syntax enable
set number relativenumber
colorscheme github
set colorcolumn=81
set tabstop=2 softtabstop=2 shiftwidth=2


"""""""""""""""""""""""""""""""""
"																"
"	Insert Mode Remaps	 					"
"																"
"""""""""""""""""""""""""""""""""
imap jk <esc>
imap kj <esc>


"""""""""""""""""""""""""""""""""
"																"
"	Leader Mappings	 							"
"																"
"""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
nmap <leader>h :nohlsearch<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>W :wq<cr>
nmap <leader>Q :qa<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>T :! npx tsc --project .<cr>
" TODO: This should be part of the tab plugin I use.
nmap <expr> <leader> nr2char(getchar()).'gt'

"""""""""""""""""""""""""""""""""
"																"
"	Status Line										"
"																"
"""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%r%y
set statusline+=%1*
set statusline+=%m
set statusline+=%*
set statusline+=%=%c,%l/%L\ %P


augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END

hi StatusLine ctermfg=34 ctermbg=15
au insertenter * hi StatusLine ctermfg=160 ctermbg=15
au insertleave * hi StatusLine ctermfg=34 ctermbg=15

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set list listchars=trail:~,tab:·»,

"""""""""""""""""""""""""""""""""
"																"
"	Convenience										"
"																"
"""""""""""""""""""""""""""""""""

nmap <leader>C i//tslint:disable-next-line:no-console<esc>
