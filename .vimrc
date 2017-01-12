call plug#begin('~/.vim/plugged')

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

"
Plug 'skywind3000/asyncrun.vim'
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" motion
Plug 'joequery/Stupid-EasyMotion'
let g:mapleader = ","

" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" File finder
Plug 'kien/ctrlp.vim'
nnoremap <Leader>p :CtrlP<cr>

" ack
" Plug 'rking/ag.vim'
Plug 'nazo/pt.vim'
nnoremap <C-a> :Pt<space>

" run
Plug 'thinca/vim-quickrun'
let g:quickrun_config = { }
nmap <Leader>r :QuickRun<cr>

" Clojure
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'paredit.vim', { 'for': [ 'clojure', 'scheme' ]}

" Javascript
" Plug 'othree/yajs.vim', { 'for': 'javascript' }
" let g:quickrun_config.javascript = { 'command': 'node', 'cmdopt': '--harmony'}

" grunt
Plug 'AtsushiM/grunt-default.vim', { 'for': [ 'js', 'coffee' ] }
let g:grunt_default_file = ['coffee']
let g:grunt_default_makefile = 'Gruntfile.coffee'

Plug 'godlygeek/tabular' " align
Plug 'Shougo/vinarise' " hex
Plug 'guns/xterm-color-table.vim' " color
Plug 'jszakmeister/vim-togglecursor' " cursor shape
Plug 'gregsexton/MatchTag', { 'for': [ 'html', 'xml' ] } " html tag
Plug 'matchit.zip'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'

Plug 'w0rp/ale'

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
set guifont=Iosevka\ Term:h12

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
highlight SignColumn ctermbg=black
highlight SignifySignAdd ctermbg=black ctermfg=green
highlight SignifySignDelete ctermbg=black ctermfg=red
highlight SignifySignChange ctermbg=black ctermfg=yellow
