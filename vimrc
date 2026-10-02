" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

set nocompatible
let mapleader = "\\"

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
set incsearch

" ====================
" generic options
" ====================
set nobackup
set nowritebackup
set noswapfile
set hidden
set autoread
set history=5000
set wildmenu

" ====================
" performance
" ====================
set lazyredraw
" Long lines (minified JS, logs) make syntax highlighting slow.
set synmaxcol=300

" ====================
" visual options
" ====================
filetype plugin indent on
" The mode is shown in the statusline.
set noshowmode
set title
set ruler
set showcmd
set showmatch
set laststatus=2
set cursorline
set number
set shortmess+=c

" spaces
set tabstop=2
set softtabstop=0
set shiftwidth=2
set smarttab

" disable folding
set nofoldenable

" Set IME disable
set imdisable
set completeopt=menuone

set guifont=Menlo:h12
set encoding=UTF-8

" ====================
" Built-in packages
" ====================
packadd! comment
packadd! editorconfig

" ====================
" Plugins
" ====================
if !filereadable(expand('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
Plug 'bronson/vim-trailing-whitespace'
Plug 'leshill/vim-json', {'for': 'json'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lifepillar/vim-solarized8'
call plug#end()

" ====================
" Set color scheme
" ====================
if has('termguicolors')
  set termguicolors
endif
syntax enable
set background=dark
try
  colorscheme solarized8
catch /^Vim\%((\a\+)\)\=:E185/
  " Not installed yet: run :PlugInstall.
  colorscheme default
endtry

" ====================
" Split navigation (tmux passes C-h/j/k/l through to vim)
" ====================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ====================
" Statusline (replaces vim-airline)
" ====================
let s:modes = {
      \ 'n': ['NORMAL', 'StlNormal'],
      \ 'i': ['INSERT', 'StlInsert'],
      \ 'v': ['VISUAL', 'StlVisual'],
      \ 'V': ['V-LINE', 'StlVisual'],
      \ "\<C-v>": ['V-BLOCK', 'StlVisual'],
      \ 'R': ['REPLACE', 'StlReplace'],
      \ 'c': ['COMMAND', 'StlNormal'],
      \ 't': ['TERMINAL', 'StlInsert'],
      \ }

function! StatusLine() abort
  let l:line = ' %f %m%r%h%w%=%y %{&fenc !=# "" ? &fenc : &enc} [%{&ff}] %3p%% %l:%c '
  if g:statusline_winid != win_getid()
    return l:line
  endif
  let [l:name, l:group] = get(s:modes, mode(), [mode(), 'StlNormal'])
  return '%#' . l:group . '# ' . l:name . ' %#StlFile#' . l:line
endfunction

" Solarized dark palette, same as the airline solarized theme.
function! s:StatusLineColors() abort
  highlight StlNormal  guifg=#002b36 guibg=#268bd2 ctermfg=0 ctermbg=4 gui=bold cterm=bold
  highlight StlInsert  guifg=#002b36 guibg=#859900 ctermfg=0 ctermbg=2 gui=bold cterm=bold
  highlight StlVisual  guifg=#002b36 guibg=#d33682 ctermfg=0 ctermbg=5 gui=bold cterm=bold
  highlight StlReplace guifg=#002b36 guibg=#dc322f ctermfg=0 ctermbg=1 gui=bold cterm=bold
  highlight StlFile    guifg=#93a1a1 guibg=#073642 ctermfg=14 ctermbg=0
endfunction

augroup statusline
  autocmd!
  autocmd ColorScheme * call s:StatusLineColors()
augroup end
call s:StatusLineColors()
set statusline=%!StatusLine()

" ====================
" File explorer (netrw, replaces NERDTree)
" ====================
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
" Open files in the window left of the explorer, like NERDTree.
let g:netrw_browse_split = 4

function! s:RevealInExplorer() abort
  let l:file = expand('%:t')
  let l:dir = expand('%:p:h')
  if exists('t:netrw_lexbufnr') && bufwinnr(t:netrw_lexbufnr) != -1
    Lexplore
  endif
  execute 'Lexplore' fnameescape(l:dir)
  if l:file !=# ''
    call search('\V' . escape(l:file, '\') . '\$')
  endif
endfunction

" netrw takes <C-h> and <C-l> unless these are mapped elsewhere. Keep them
" for split navigation.
nmap <Leader>h <Plug>NetrwHideEdit
nmap <Leader>l <Plug>NetrwRefresh

nnoremap <silent> <Leader>n :Lexplore<CR>
nnoremap <silent> <Leader>r :call <SID>RevealInExplorer()<CR>

" ====================
" Comments (built-in comment package, replaces nerdcommenter)
" ====================
" gc / gcc also work. The built-in toggle adds a space after the delimiter.
nmap <Leader>c<Space> <Plug>(comment-toggle-line)
xmap <Leader>c<Space> <Plug>(comment-toggle)
nmap <Leader>cc <Plug>(comment-toggle-line)
xmap <Leader>cc <Plug>(comment-toggle)
nmap <Leader>cu <Plug>(comment-toggle-line)
xmap <Leader>cu <Plug>(comment-toggle)

" ====================
" Finder (ctrlp, replaces Unite)
" ====================
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Inside ctrlp: <C-x> split, <C-v> vsplit, <C-t> tab, <Esc> close.
let g:ctrlp_map = '<C-N>'

" Current Dir
nnoremap <silent> <C-c> :CtrlPCurFile<CR>
" recent list (<C-M> is the same key as Enter, so it moved to <Leader>m)
nnoremap <silent> <Leader>m :CtrlPMRU<CR>
" buffer list
nnoremap <silent> <C-P> :CtrlPBuffer<CR>
" yank history
nnoremap <silent> <C-Y> :registers<CR>
