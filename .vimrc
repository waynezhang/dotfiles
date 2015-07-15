filetype plugin indent on
syntax on 
set nocompatible
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
set t_vb=
set nobackup " no backup
set nowritebackup
set noswapfile
set backspace=indent,eol,start " backspace fix

colorscheme desert
se cursorline
hi CursorLine cterm=none ctermbg=236

let filetype_m = 'objc' " file type fix

" system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" functions
function! CurDir()
  let curdir = substitute(getcwd(), "/home/wayne/", "‾/", "g")
  return curdir
endfunction

" macvim
if has("gui_macvim")
  set transparency=10
  set guifont=PragmataPro:h12
  autocmd VimLeave * macaction terminate:
endif

" NeoBundle start
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-pathogen'
set runtimepath+=~/.vim/bundle/vim-pathogen/
call pathogen#infect()

" status line
NeoBundle 'itchyny/lightline.vim'
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
NeoBundle 'joequery/Stupid-EasyMotion'
let g:mapleader = ","

" git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mhinz/vim-signify'
highlight SignColumn ctermbg=black
highlight SignifySignAdd ctermbg=black ctermfg=green
highlight SignifySignDelete ctermbg=black ctermfg=red
highlight SignifySignChange ctermbg=black ctermfg=yellow

" File finder
NeoBundle 'kien/ctrlp.vim'
nnoremap <Leader>p :CtrlP<cr>

" ack
NeoBundle 'rking/ag.vim'
nnoremap <C-a> :Ag<space>

" nerdtree
NeoBundle 'scrooloose/nerdtree'
nnoremap <Leader><tab> :NERDTreeToggle<cr>

" json
" reformat need yajl
NeoBundle 'elzr/vim-json'
function! JSONFormat()
  exe '%!json_reformat'
endfunction
command! -nargs=0 JSONFormat call JSONFormat()
map <Leader>j :JSONFormat<CR>

" run
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = { }
nmap <Leader>r :QuickRun<cr>

" newlisp
NeoBundle 'vim-scripts/newlisp'
au BufRead,BufNewFile *.lsp set filetype=newlisp

" Clojure
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'paredit.vim'
NeoBundle 'jebberjeb/vim-clojure-conceal'

" Javascript
NeoBundle 'othree/yajs.vim'
let g:quickrun_config.javascript = { 'command': 'node', 'cmdopt': '--harmony'}

" grunt
NeoBundle 'AtsushiM/grunt-default.vim'
let g:grunt_default_file = ['coffee']
let g:grunt_default_makefile = 'Gruntfile.coffee'

NeoBundle 'gabrielelana/vim-markdown' " markdown
NeoBundle 'godlygeek/tabular' " align
NeoBundle 'digitaltoad/vim-jade' " jade
NeoBundle 'Shougo/vinarise' " hex
NeoBundle 'guns/xterm-color-table.vim' " color
NeoBundle 'jszakmeister/vim-togglecursor' " cursor shape
NeoBundle 'vim-scripts/TaskList.vim' " tasklist
NeoBundle 'kchmck/vim-coffee-script' " coffee
NeoBundle 'scrooloose/syntastic'
NeoBundle 'gregsexton/MatchTag' " html tag
NeoBundle 'matchit.zip'
NeoBundle 'keith/swift.vim' " swift

call neobundle#end()
NeoBundleCheck
" NeoBundle end
