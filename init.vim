call plug#begin('~/.vim/plugged')

	Plug 'christoomey/vim-tmux-navigator'
	Plug 'jiangmiao/auto-pairs'
	Plug 'flazz/vim-colorschemes'
	Plug 'jelera/vim-javascript-syntax'

call plug#end()

colorscheme PaperColor

" Remap leader key to space - must come 1st!
let mapleader="\<Space>"
" TODO -> replace with symlink and move to dotfiles
nmap <leader>so :source ~/.config/nvim/init.vim<cr>

" Enable slamming of jk or kj to escape
imap jk <esc>
imap kj <esc>

" Relative line numbers but display actual line
set number relativenumber

" Tabs like I like them.
"		tabstop: distance of a tab
"		softtabstop: tab characters indent to tabe lines, i.e. MS Word
set tabstop=4 softtabstop=4 shiftwidth=4

set listchars=eol:$,trail:~,tab:>.
set list

" Remap Leader

" Leader Mappings
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>W :wq<cr>
nmap <leader>Q :qa<cr>
