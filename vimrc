set nocompatible

highlight Normal ctermbg=white ctermfg=black

""""""""""""""""""""""""""""""""
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
  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'dcchuck/tabline.vim'
  Plug 'tpope/vim-vinegar'

  " Autocompletion
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-endwise'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Preview the current markdown file in the browser
  Plug 'shime/vim-livedown', { 'for': 'markdown' }

  " Syntax
  Plug 'MaxMEllon/vim-jsx-pretty'             " React
  Plug 'HerringtonDarkholme/yats.vim'         " .ts & .tsx
  Plug 'tomlion/vim-solidity'
  " Plug 'elzr/vim-json'                        " .json pretty print

  " Use repeat for plugins
  Plug 'tpope/vim-repeat'

  " Show colors in place of codes
  Plug 'chrisbra/Colorizer'

  " Testing
  Plug 'junegunn/vader.vim', { 'for': 'vader' }
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

let g:tmux_navigator_no_mappings = 1

nmap <silent> <C-g><C-h> :TmuxNavigateLeft<cr>
nmap <silent> <C-g><C-j> :TmuxNavigateDown<cr>
nmap <silent> <C-g><C-k> :TmuxNavigateUp<cr>
nmap <silent> <C-g><C-l> :TmuxNavigateRight<cr>
nmap <silent> <C-g><C-\> :TmuxNavigatePrevious<cr>

" Copy the visual selection to your local clipboard
" mycopy is defined in the zshenv
vnoremap <C-c> :w !mycopy<CR><CR>

" LEAVE!
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

hi StatusLine ctermfg=white ctermbg=250
au insertenter * hi StatusLine ctermfg=red ctermbg=white
au insertleave * hi StatusLine ctermfg=white ctermbg=250


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

" Keymappings
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
