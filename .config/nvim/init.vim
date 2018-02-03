call plug#begin()
  " Run Unix commands easily from Vim
  Plug 'tpope/vim-eunuch'

  " Nova Color Scheme
  Plug 'trevordmiller/nova-vim'

  " File search (requires Python)
  Plug 'mileszs/ack.vim'

  " List Buffers in tabline
  Plug 'ap/vim-buftabline'

  " Airline
  Plug 'bling/vim-airline'

  " Staged version of the file side by side with the working tree version
  Plug 'tpope/vim-fugitive'

  " Command Line fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  " Comment functions so powerful—no comment necessary
  Plug 'scrooloose/nerdcommenter'

  " File system explorer
  Plug 'scrooloose/nerdtree'

  " Scratch Window
  Plug 'mtth/scratch.vim'

  " Asynchronous lint engine
  Plug 'w0rp/ale'

  " Dropdown completion
  Plug 'roxma/nvim-completion-manager'

  " Snippet engine
  Plug 'SirVer/ultisnips'

  " Snippets for multiple languages
  Plug 'honza/vim-snippets'

  " Window resizing to golden ratio
  " Plug 'roman/golden-ratio'

  " Vim alignment
  Plug 'junegunn/vim-easy-align'

  " mappings to easily delete, change and add surroundings in pairs.
  Plug 'tpope/vim-surround'

  " languages
  Plug 'pangloss/vim-javascript',       { 'for': 'javascript' }
  Plug 'mxw/vim-jsx',                   { 'for': 'javascript' }
  Plug 'kana/vim-vspec',                { 'for': 'vim'        }
  Plug 'jelera/vim-javascript-syntax',  { 'for': 'javascript' }
  Plug 'elixir-editors/vim-elixir'
  Plug 'ElmCast/elm-vim'
  Plug 'hashivim/vim-terraform'

  " Latest version of matchit.vim
  Plug 'tmhedberg/matchit'

  " Helpers for Unix
  Plug 'tpope/vim-eunuch'

  " Clojure REPL functionality, jump-to-source, omni-complete etc.
  Plug 'tpope/vim-fireplace'
  Plug 'guns/vim-clojure-static'

  " Rainbow parentheses
  Plug 'luochen1990/rainbow'

  " Enable repeating for supported plugin maps
  Plug 'tpope/vim-repeat'

  " Projectionist for mapping between test and app files
  Plug 'tpope/vim-projectionist'

  " Language Server Protocol support for NeoVim (used by ReasonML)
  Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': './install.sh' }	

  " ReasonML support
  Plug 'reasonml-editor/vim-reason-plus'

  " Automatic pane resizing
  Plug 'roman/golden-ratio'

  " Crystal language support
  Plug 'rhysd/vim-crystal'

  " Rust language support
  Plug 'rust-lang/rust.vim'
call plug#end()

" Don't make vim compatible with vi
set nocompatible


" Switch syntax highlighting on
syntax on

" Detect filetypes and load plugin and indents
filetype plugin indent on

" Reload files changed outside vim
set autoread

" Encoding is UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Set unix line-endings
set fileformat=unix

" Enable  plugin for enhanced '%'
runtime macros/.vim

" Backspace deletes over line breaks and auto-indent
set backspace=indent,eol,start

" Remove .ext files but not swapfiles
set nobackup
set writebackup
set noswapfile

" Search:
set incsearch     " find match as you type

" Indentation:
set expandtab     " use spaces instead of tabs
set autoindent    " autoindent based on line above
set smartindent   " smarter indenting for C-like langugaes
set shiftwidth=2  " when reading, tabs are 2 spaces
set softtabstop=2 " in insert mode, tabs are two spaces
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2

" Set display options
set colorcolumn=100
set numberwidth=2
set nowrap
set shiftround
set number
set showcmd
set ruler
set cursorline

" Set colorscheme (requires vim termguicolors support)
colorscheme nova

" Enable matchit plugin
runtime macros/matchit.vim

let mapleader=','

map <leader>d :execute 'NERDTreeToggle'<CR>
map <leader>t :execute 'FZF'<CR>

" Highlight white spaces
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" Show trailing white space
:match ExtraWhitespace /\s\+$/

let g:jsx_ext_required = 0

" Ruby DSLs
au BufNewFile,BufRead Podfile,Vagrantfile,Guardfile set ft=ruby

" Align line-wise comment delimiters flush left instaead of following code
let g:NERDDefaultAlign='left'
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespaces=1

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Rainbow parentheses config
let g:rainbow_active = 1
let g:rainbow_conf = {
      \ 'guifgs': ['#DAD996', '#F1C392', '#D08FC1', '#9A95DF'],
      \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \ 'operators': '_,_',
      \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \ 'separately': {
      \ '*': {},
      \ 'tex': {
      \  'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
      \ },
      \ 'lisp': {
      \  'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \ },
      \ 'vim': {
      \  'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \ },
      \ 'html': {
      \  'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \ },
      \  'css': 0,
      \ }
      \}

let g:LanguageClient_serverCommands = {
      \ 'reason': ['ocaml-language-server', '--stdio'],
      \ 'ocaml': ['ocaml-language-server', '--stdio'],
      \ }

nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>

" Prettier formatting for JavaScript
" let g:ale_fixers = {}
" let g:ale_fixers['javascript'] = ['prettier']
" 
" let g:ale_fix_on_save = 1

set listchars=tab:▸\ ,eol:¬
set list
highlight NonText guifg=#556873
highlight SpecialKey guifg=#556873

syntax enable
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
