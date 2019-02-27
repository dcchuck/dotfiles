"""""""""""""""""""""""""""""""""
"                               "
" Plugins                       "
"                               "
"""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

  " Git
  Plug 'tpope/vim-fugitive'

  " Word Object Manipulation
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'

  " Navigation
  Plug 'christoomey/vim-tmux-navigator'
  Plug '/usr/local/opt/fzf'
  Plug 'dcchuck/tabline.vim'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-dispatch'

  " Colorscheme
  Plug 'albertorestifo/github.vim'

  " Autocompletion
  Plug 'jiangmiao/auto-pairs'
  Plug 'ervandew/supertab'
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-endwise'

  " Typescript
  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'Quramy/tsuquyomi', { 'for': 'typescript'  }
  Plug 'heavenshell/vim-tslint'

  " Convenience
  Plug 'elzr/vim-json'

call plug#end()

" auto execute TSLint on save
autocmd BufWritePost *.ts,*.tsx call tslint#run('a', win_getid())

augroup tslint
  function! s:typescript_after(ch, msg)
    let cnt = len(getqflist())
    if cnt > 0
      echomsg printf('[Tslint] %s errors', cnt)
    endif
    endfunction
  let g:tslint_callbacks = {
    \ 'after_run': function('s:typescript_after')
    \ }

  let g:tsuquyomi_disable_quickfix = 1

  function! s:ts_quickfix()
    let winid = win_getid()
    execute ':TsuquyomiGeterr'
    call tslint#run('a', winid)
  endfunction

  autocmd BufWritePost *.ts,*.tsx silent! call s:ts_quickfix()
augroup END

set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set backspace=2

"""""""""""""""""""""""""""""""""
"                               "
" Visuals                       "
"                               "
"""""""""""""""""""""""""""""""""
syntax enable
set number relativenumber
colorscheme github
set colorcolumn=81

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
nmap <leader>P :w !pbcopy<cr><cr>

" Internet says this is better...
nmap <C-p> :FZF<cr>

" Copy and paste to the clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>

" Tab navigation
nmap <expr> <leader> nr2char(getchar()).'gt'

" recursively search the current directory for the word under the cursor
nmap <leader>f :grep -r --exclude-dir=node_modules <cword> *<CR>


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

hi StatusLine ctermfg=22 ctermbg=15
au insertenter * hi StatusLine ctermfg=160 ctermbg=15
au insertleave * hi StatusLine ctermfg=22 ctermbg=15


"""""""""""""""""""""""""""""""""
"                               "
" Convenience                   "
"                               "
"""""""""""""""""""""""""""""""""
autocmd QuickFixCmdPost *grep* cwindow

" LEAVE!
imap <C-l> <esc>
