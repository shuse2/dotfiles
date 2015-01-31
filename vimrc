let mapleader = "\\"

" ====================
" Set color scheme
" ====================
syntax enable
colorscheme molokai
let g:molokai_original = 1

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
" spaces
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set number

" Set IME disable
set imdisable

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Start bundle setups
" ====================
" General
" ====================
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tomtom/tcomment_vim'
" ====================
" NerdTree
" ====================
NeoBundle 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>

" ====================
" Unite
" ====================
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

let g:unite_enable_start_insert=1
" buffer list
noremap <C-P> :Unite buffer<CR>
" list
noremap <C-N> :Unite -buffer-name=file file<CR>
" recent list
noremap <C-Z> :Unite file_mru<CR>
" open by currently opening file
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" split
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" Split vertical
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" end with 2 ESC key
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" ====================
" Programming
" ====================
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'vim-ruby/vim-ruby'


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
