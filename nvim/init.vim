call plug#begin('~/.config/nvim/plugged')

" status line
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
nnoremap <C-p> :FZF<cr>

" ack
Plug 'jremmen/vim-ripgrep'
nnoremap <C-a> :Rg<space>

" run
Plug 'thinca/vim-quickrun'
nmap <Leader>r :QuickRun<cr>

Plug 'guns/xterm-color-table.vim' " color
Plug 'gregsexton/MatchTag', { 'for': [ 'html', 'xml' ] } " html tag
Plug 'vim-scripts/matchit.zip' " % match
Plug 'sheerun/vim-polyglot' " language pack

Plug 'w0rp/ale' " lint

Plug 'nanotech/jellybeans.vim', { 'as': 'jellybeans' }

call plug#end()

filetype plugin indent on
syntax on 
set tabstop=2
set shiftwidth=2
set nu
set wildmenu
set magic
if !has('nvim')
  set showmatch
endif
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
set novb " no bell
set nobackup " no backup
set nowritebackup
set noswapfile
set backspace=indent,eol,start " backspace fix
set inccommand=nosplit

" file type fix
let filetype_m = 'objc'
au FileType objc set shiftwidth=4
let g:jsx_ext_required = 1

" shell syntax fix
au FileType sh let b:is_bash=1
au FileType sh syntax on

" system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

colorscheme jellybeans
se cursorline
hi CursorLine cterm=none ctermbg=236
highlight SignColumn ctermbg=black
highlight SignifySignAdd ctermbg=black ctermfg=green
highlight SignifySignDelete ctermbg=black ctermfg=red
highlight SignifySignChange ctermbg=black ctermfg=yellow