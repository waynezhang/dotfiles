call plug#begin('~/.nvim/plugged')

" status line
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'fugitive' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly ? "x" : ""}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'subseparator': { 'left': '>', 'right': '<' },
      \ }
set laststatus=2

" motion
Plug 'joequery/Stupid-EasyMotion'
let g:mapleader = ","

" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
highlight SignColumn ctermbg=black
highlight SignifySignAdd ctermbg=black ctermfg=green
highlight SignifySignDelete ctermbg=black ctermfg=red
highlight SignifySignChange ctermbg=black ctermfg=yellow

" File finder
Plug 'kien/ctrlp.vim'
nnoremap <Leader>p :CtrlP<cr>

" ack
Plug 'rking/ag.vim'
nnoremap <C-a> :Ag<space>

" run
Plug 'thinca/vim-quickrun'
let g:quickrun_config = { }
nmap <Leader>r :QuickRun<cr>

" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'paredit.vim', { 'for': [ 'clojure', 'scheme' ]}

" Javascript
Plug 'othree/yajs.vim', { 'for': 'javascript' }
let g:quickrun_config.javascript = { 'command': 'node', 'cmdopt': '--harmony'}

" grunt
Plug 'AtsushiM/grunt-default.vim', { 'for': [ 'js', 'coffee' ] }
let g:grunt_default_file = ['coffee']
let g:grunt_default_makefile = 'Gruntfile.coffee'

Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' } " markdown
Plug 'godlygeek/tabular' " align
Plug 'digitaltoad/vim-jade', { 'for': 'jade' } " jade
Plug 'Shougo/vinarise' " hex
Plug 'guns/xterm-color-table.vim' " color
Plug 'jszakmeister/vim-togglecursor' " cursor shape
Plug 'vim-scripts/TaskList.vim' " tasklist
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' } " coffee
Plug 'scrooloose/syntastic'
Plug 'gregsexton/MatchTag', { 'for': [ 'html', 'xml' ] } " html tag
Plug 'matchit.zip'
Plug 'keith/swift.vim', { 'for': 'swift' } " swift
Plug 'nathanaelkane/vim-indent-guides'

Plug 'majutsushi/tagbar'
map <Leader>b :TagbarToggle<cr>
let g:indent_guides_auto_colors = 0
hi IndentGuidesEven ctermbg=233

call plug#end()

filetype plugin indent on
syntax on 
set tabstop=2
set shiftwidth=2
set nu
set wildmenu
set magic
set showmatch
set encoding=utf-8
set expandtab
set autoindent
set fcs=vert:│ " solid vsplit separator
set virtualedit=onemore " virtual space at eol
set autoread " auto reload
set list " invisable chars
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪
set scrolloff=3 " minimal lines below cursor
set hlsearch
set incsearch
set ignorecase
set smartcase
set vb " no bell
set nobackup " no backup
set nowritebackup
set noswapfile
set backspace=indent,eol,start " backspace fix

let filetype_m = 'objc' " file type fix

" system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

colorscheme desert
se cursorline
hi CursorLine cterm=none ctermbg=236
