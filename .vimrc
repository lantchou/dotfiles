syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
    " coqtail
    Plug 'whonore/Coqtail'

    " incsearch
    Plug 'haya14busa/incsearch.vim'

    " Color schemes and shit
    Plug 'morhetz/gruvbox'
    Plug 'dracula/vim', {'as': 'dracula'}
    Plug 'tomasr/molokai'
    Plug 'sainnhe/gruvbox-material'
    Plug 'colepeters/spacemacs-theme.vim'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'flazz/vim-colorschemes'
    Plug 'cocopon/iceberg.vim'
    Plug 'nanotech/jellybeans.vim'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'neovimhaskell/haskell-vim'
    Plug 'junegunn/seoul256.vim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'micha/vim-colors-solarized'
    Plug 'embark-theme/vim', { 'as': 'embark' }
    Plug 'arzg/vim-colors-xcode'
call plug#end()

" color scheme 'n stuff
set background=dark
colorscheme gruvbox

" airline stuff
let g:airline_theme='gruvbox'

" set leader key
let mapleader = " "

" maps for split window navigation
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>

" maps for vertical resize
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" map keys to navigate tabs
map <silent><F8> :tabp<CR>
map <silent><F9> :tabn<CR>

" incsearch maps
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" disable 'esckeys' option to fix SHIFT+o lag
set noesckeys

" coq
    " disable default coq maps
    let g:coqtail_nomap = 1
    
    " custom maps
    nmap <silent><C-j> <Plug>CoqNext<Plug>CoqJumpToEnd
    nmap <silent><C-k> <Plug>CoqUndo<Plug>CoqJumpToEnd
    nmap <silent><C-l> <Plug>CoqToLine<Plug>CoqJumpToEnd
    imap <silent><C-j> <Plug>CoqNext<Plug>CoqJumpToEnd
    imap <silent><C-k> <Plug>CoqUndo<Plug>CoqJumpToEnd
    imap <silent><C-l> <Plug>CoqToLine<Plug>CoqJumpToEnd
