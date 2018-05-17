call plug#begin('~/.vim/plugged')

	Plug 'christoomey/vim-tmux-navigator'
	Plug 'jiangmiao/auto-pairs'
	Plug 'flazz/vim-colorschemes'
	Plug 'jelera/vim-javascript-syntax'
	Plug 'tpope/vim-commentary'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'ervandew/supertab'
	" requires an npm install in tern directory
	Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
	Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
	Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
	Plug 'ap/vim-css-color'
	Plug 'alvan/vim-closetag'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'dcchuck/tabline.vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'leafgarland/typescript-vim'
	Plug 'tomlion/vim-solidity'
	Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" Enable Deoplete @ startup
let g:deoplete#enable_at_startup = 1

" https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
" No snippet completion though. Maybe one day.
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'buffer', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1

" or just disable the preview entirely
" set completeopt-=preview
"
" or bind :pbclose

" This should let me use the local tern 
" npm i -g tern as  well
let $PATH=expand('<sfile>:h').'/path/to/tern_for_vim/node_modules/.bin:'.$PATH

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

colorscheme PaperColor

" Remap leader key to space - must come 1st!
let mapleader="\<Space>"
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
nmap <expr> <leader> nr2char(getchar()).'gt'
nmap <leader>' cs"'
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>W :wq<cr>
nmap <leader>Q :qa<cr>
nmap <leader>h :nohlsearch<cr>
nmap <leader>J :%!python -m json.tool<cr>

" node specific
nmap <leader>p :e package.json<cr>

" Show the cursorline & cursorline only in the active window
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

" TODO - autoformat JSON file

set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%r%y
set statusline+=%1*
set statusline+=%m
set statusline+=%*
set statusline+=%=%c,%l/%L\ %P

hi User1 ctermfg=white ctermbg=red
au insertenter * hi StatusLine ctermfg=white ctermbg=red
au insertleave * hi StatusLine ctermfg=254 ctermbg=24

set colorcolumn=141
" Select with yank & put to keyboard twitter.com/searls
nnoremap <leader>cc :call system('pbcopy', @0)<CR>
