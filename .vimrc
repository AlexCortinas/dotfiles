set shell=/bin/bash
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used
" Bundle instead of Plugin)
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'PotatoesMaster/i3-vim-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" , as leader
let mapleader=","

" prevents some security exploits
set modelines=0

" Indentation
filetype indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf8
set scrolloff=3
set autoindent
set showmode
set showcmd " last command shown
set hidden
set wildmenu " shows a menu for autocomplete
set wildmode=list:longest
set visualbell
" set cursorline " underline current line
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile "creates a undo file to undo even after closing
set lazyredraw " no need to redraw in many ocassions

set mouse=a

" fix Vim's horribly broken default regex handling by automatically
" inserting a \v before any string you search for
nnoremap / /\v
vnoremap / /\v

" this two lines makes lowercase search case insensitive
" but uppercase/mixed search case sensitive
set ignorecase
set smartcase

set gdefault " avoid last g on regex searches
set incsearch " searching while input the search field
set showmatch " show end parenthesis or similar
set hlsearch " highlights search results

" , + space disables highlights
nnoremap <leader><space> :nohlsearch<CR>

" tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
" set colorcolumn=85

" invisible characters for tab and eol
" set list
" set listchars=tab:▸\ ,eol:¬

" Disable arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" for moving on wrapped lines
nnoremap j gj
nnoremap k gk

" remapping f1 to esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" saves on losing focus
au FocusLost * :wa

" ,ft fold tag
nnoremap <leader>ft Vatzf

" open .vimrc on a split
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" using jj to escape insert mode
inoremap jj <ESC>

" using ,w to open vertical split
nnoremap <leader>w <C-w>v<C-w>l

" switch the window
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

syntax enable

" colorscheme base16-default
" set background=dark

set ffs=unix,dos,mac

" Multiple windows and navegation
set splitbelow " new windows below
set splitright " new windows to right side

" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.2)<cr>
nnoremap <silent> N N:call HLNext(0.2)<cr>

function! HLNext (blinktime)
    let target_pat = '\c\%#'.@/
    let ring = matchadd('ErrorMsg', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = 'node_modules\|bower_components'
