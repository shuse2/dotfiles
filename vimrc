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
set shiftwidth=2
set smarttab
set number

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
NeoBundle 'leshill/vim-json'
NeoBundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" ====================
" NerdTree
" ====================
NeoBundle 'scrooloose/nerdtree'
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ====================
" Unite
" ====================
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }

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
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'fatih/vim-go'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
NeoBundle 'wavded/vim-stylus.git'
NeoBundle 'Valloric/YouCompleteMe.git'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'kelan/gyp.vim.git'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'wesQ3/vim-windowswap'
NeoBundle 'raichoo/haskell-vim'
NeoBundle 'tpope/vim-dispatch'

" let YCM to select first suggestion
let g:ycm_key_select_completion = '<CR>'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
