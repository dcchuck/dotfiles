set nocompatible

highlight Normal ctermbg=white ctermfg=black

""""""""""""""""""""""""""""""""
"                               "
" Plugins                       "
"                               "
"""""""""""""""""""""""""""""""""

let g:tmux_navigator_no_mappings = 1

call plug#begin('~/.vim/plugged')

  " git plugin
  Plug 'tpope/vim-fugitive'
  " add commenting bindings
  Plug 'tpope/vim-commentary'
  " surrounding quotes, brackets, etc.
  Plug 'tpope/vim-surround'
  " command to smooth out tmux panes -> vim split navigation.
  " see: plugin bindings
  Plug 'christoomey/vim-tmux-navigator'
  " fzf fuzzy file finder
  Plug 'junegunn/fzf.vim'
  " tabs in the top right
  Plug 'dcchuck/tabline.vim'
  " customize netrw
  Plug 'tpope/vim-vinegar'
  " use the dot-operator with plugin
  Plug 'tpope/vim-repeat'
  " Captain's Log
  Plug 'dcchuck/captains-log.vim'
call plug#end()

" Inser spaces; 2 of then; for the > indentation; and for default indentation
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
" Make backspace act 'like normal' - delete over line breaks, indentations, .etc
set backspace=2

"""""""""""""""""""""""""""""""""
"                               "
" Mappings                      "
"                               "
"""""""""""""""""""""""""""""""""
" Plugin Mappings
" See tmux.conf for paired bindings
" Vim does not register Alt well in all terminals, apparently one of those in
" the one I'm in. So for now, creating these complex commands and bindings
" them to tmux does the trick
nmap <silent> <C-g><C-h> :TmuxNavigateLeft<cr>
nmap <silent> <C-g><C-j> :TmuxNavigateDown<cr>
nmap <silent> <C-g><C-k> :TmuxNavigateUp<cr>
nmap <silent> <C-g><C-l> :TmuxNavigateRight<cr>
nmap <silent> <C-g><C-\> :TmuxNavigatePrevious<cr>

" |-|
" | |_ EADER
" |___|       mappings

let mapleader = "\<Space>"

" Disable the highlights created from a file search
nmap <leader>h :nohlsearch<cr>

" Shortcuts for writing and quitting files
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>W :wa<cr>
nmap <leader>Q :qa<cr>

" Put a blank line above or below
nmap <leader>o o<Esc>k
nmap <leader>O O<Esc>j

" Remove all trailing whitespace
nmap <leader>$ :%s/\s\+$//e<CR>

" |-\ ||
" |  \||ORMAL MODE
" |_|\_|      mappings
"

" " 'F'ind me the file named...
nmap <C-f> :FZF<cr>

" Buffer in a new tab to the current buffer's directory
nmap <C-t> :tabe %:p:h<cr>

" <leader> (some number that correspdonds to a tab) navigates to that tab
nmap <expr> <leader> nr2char(getchar()).'gt'

" Copy the visual selection to your local clipboard
" mycopy is defined in the zshenv
vnoremap <C-c> :w !mycopy<CR><CR>

" LEAVE! My escape mapping of choice
imap <C-l> <esc>

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
hi User1 ctermfg=red ctermbg=white

" Split Statusline - left and right justified
set statusline+=%=

" Column,line/Lines
set statusline+=%c,%l/%L

"""""""""""""""""""""""""""""""""
"                               "
" Convenience                   "
"                               "
"""""""""""""""""""""""""""""""""

" Conqueror of Completion

" Needed to show certain messages in vanilla vim
set hidden
set updatetime=300
set shortmess=aFc

" Fuzzy Search!
" http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,ts,md,tsx,rb,html,config,py,cpp,c,go,hs,rs,conf,vimrc,yml,csv}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* FindTheseWords call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
nmap <C-p> :FindTheseWords<cr>

hi Pmenu ctermbg=black ctermfg=white

"""""""""""""""""""""""""""""""""
"                               "
" Visuals                       "
"                               "
"""""""""""""""""""""""""""""""""
" -> Moving this to the bottom resolved issues with my cursorline highlight
syntax enable
set number
set colorcolumn=81

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set list listchars=trail:~,tab:·»,

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" 230 is the lightorange color from the github color scheme
hi CursorLineNr ctermbg=230 cterm=none
hi CursorLine ctermbg=230 cterm=none

" Color Codes Cheat Sheet: https://jonasjacek.github.io/colors/
hi LineNr ctermfg=250

function Pypry()
  let text = "import code; code.interact(local=dict(globals(), **locals()))"
  exe "normal! a" . text . "\<Esc>"
endfunction

nmap <C-i> :call Pypry()<cr>
nmap <A-i> :call Pypry()<cr>
set rtp+=/opt/homebrew/opt/fzf

" use the latest regular expression engine. Proved more performant when using
" in buffer type checking
set re=0

" use rg with FZF; this should respect the .gitignore
let $FZF_DEFAULT_COMMAND = 'rg --files'

" Use distinguished colorscheme
colo distinguished
