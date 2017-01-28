let mapleader = "\\"

" ====================
" Set color scheme
" ====================
syntax enable
set background=dark
colorscheme solarized

" ====================
" mouse options
" ====================
if has("mouse")
  set mouse=a
endif

" ====================
" search
" ====================
set ignorecase

" ====================
" generic options
" ====================
set nobackup
set noswapfile
set incsearch

" ====================
" visual options
" ====================
filetype plugin indent on
set showmode
set title
set ruler
set showcmd
set showmatch
set laststatus=2
set cursorline
set ttyfast
set autoread
" spaces
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set number

set wildmenu
set history=5000


" Set IME disable
set imdisable
set completeopt=menuone

" Set for powerline
set guifont=Ricty\ Regular\ for\ Powerline:h14

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
 if &compatible
   set nocompatible               " Be iMproved
 endif


if !filereadable(expand('~/.vim/autoload/plug.vim'))
    ! curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Start bundle setups
" ====================
" General
" ====================
Plug 'bronson/vim-trailing-whitespace'
Plug 'leshill/vim-json', {'for': 'json'}
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'jiangmiao/auto-pairs'
" ====================
" NerdTree
" ====================
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
Plug 'scrooloose/nerdcommenter'
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" " Enable trimming of trailing whitepace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" ====================
" Unite
" ====================
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/plugged/vimproc.vim', 'do': 'make' }

let g:unite_enable_start_insert=0
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=50
let g:unite_source_file_mru_filename_format=''

" Current Dir
noremap <C-c> :UniteWithBufferDir -buffer-name=files file<CR>
" recent list
noremap <C-M> :Unite file_mru<CR>
" buffer list
noremap <C-P> :Unite buffer<CR>
" open bookmark
noremap <C-B> :Unite bookmark<CR>
" list
noremap <C-N> :Unite -buffer-name=file file<CR>
" yank history
noremap <C-Y> :Unite history/yank<CR>

" split
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" Split vertical
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" end with 2 ESC key
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" ====================
" Programming
" ====================
Plug 'scrooloose/syntastic'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" " Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><CR> neocomplete#smart_close_popup() . "\<CR>"
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

" GO
Plug 'fatih/vim-go', {'for': 'go'}
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" JS
Plug 'mxw/vim-jsx', {'for': 'jsx'}
Plug 'jelera/vim-javascript-syntax', {'for': 'js'}
Plug 'moll/vim-node', {'for': 'js'}
Plug 'walm/jshint.vim', {'for': 'js'}


" Initialize plugin system
call plug#end()
endif
