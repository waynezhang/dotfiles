set nocompatible

" package
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" pathogen
NeoBundle 'tpope/vim-pathogen'
call pathogen#infect()

" basic
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

" color
colorscheme desert
se cursorline

" functions
function! CurDir()
  let curdir = substitute(getcwd(), "/home/wayne/", "‾/", "g")
  return curdir
endfunction

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
NeoBundle 'airblade/vim-gitgutter'
highlight SignColumn ctermbg=black

" multi cursor
NeoBundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key = '<C-j>'
let g:multi_cursor_prev_key = '<C-k>'

" expand region
NeoBundle 'terryma/vim-expand-region'

" solid vsplit separator
set fcs=vert:│

" virtual space at eol
set virtualedit=onemore

" auto reload
set autoread

" invisable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

" minimal lines below cursor
set scrolloff=3

" search
set hlsearch
set incsearch

" case insensitive search
set ignorecase
set smartcase

" no bell
set vb
set t_vb=

" no backup
set nobackup
set nowritebackup
set noswapfile

" system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" color
NeoBundle 'guns/xterm-color-table.vim'

" highlight current line
hi CursorLine cterm=none ctermbg=236

" cursor shape
NeoBundle 'jszakmeister/vim-togglecursor'

" File finder
NeoBundle 'kien/ctrlp.vim'
" let g:ctrlp_map = '<L-P>'
nnoremap <Leader>p :CtrlP<cr>


" ack
NeoBundle 'mileszs/ack.vim'
nnoremap <C-a> :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

" nerdtree
NeoBundle 'scrooloose/nerdtree'
nnoremap <Leader><tab> :NERDTreeToggle<cr>

" scratch
NeoBundle 'kana/vim-scratch'
nmap <C-@> <Plug>(scratch-open)

" global tags
" NeoBundle 'vim-scripts/gtags.vim'
" map <C-n> :cn<CR>
" map <C-p> :cp<CR>
" map <C-]> :GtagsCursor<CR>

" backspace fix
set backspace=indent,eol,start

" json
" reformat need yajl
NeoBundle 'elzr/vim-json'
function! JSONFormat()
  exe '%!json_reformat'
endfunction
command! -nargs=0 JSONFormat call JSONFormat()
map <Leader>j :JSONFormat<CR>

" hex
NeoBundle 'Shougo/vinarise'

" tasklist
NeoBundle 'vim-scripts/TaskList.vim'
map <Leader>l <Plug>TaskList

" sudo
NeoBundle 'vim-scripts/sudo.vim'

" compile and run
NeoBundle 'xuhdev/SingleCompile'
call SingleCompile#SetCompilerTemplate('objc', 'clang',
      \ 'the Clang C and Objective-C compiler', 'clang',
      \ '-F /System/Library/Frameworks -lobjc -framework Cocoa -framework Foundation -g -fobjc-arc -o $(FILE_TITLE)$', g:SingleCompile_common_run_command)
call SingleCompile#SetPriority('objc', 'clang', 70)
nmap <Leader>r :SCCompileRun<cr>

" newlisp
NeoBundle 'vim-scripts/newlisp'
au BufRead,BufNewFile *.lsp set filetype=newlisp
call SingleCompile#SetCompilerTemplate('newlisp', 'newlisp',
      \ 'the Clang C and Objective-C compiler', 'newlisp',
      \ '-x $(FILE_NAME)$ $(FILE_TITLE)$',  'chmod +x $(FILE_TITLE)$ && $(FILE_EXEC)$')
nmap <Leader>r :SCCompileRun<cr>

" Clojure
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'ssh://hg@bitbucket.org/kovisoft/paredit'
NeoBundle 'jebberjeb/vim-clojure-conceal'

NeoBundle 'tpope/vim-surround'

NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'jelera/vim-javascript-syntax'

" html tag
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'matchit.zip'

" ctags
" `npm -g https://github.com/ramitos/jsctags` for js
NeoBundle 'majutsushi/tagbar'
map <Leader>t :TagbarToggle<cr>
" `gem install CoffeeTags` first
NeoBundle 'lukaszkorecki/CoffeeTags'
" add a definition for Objective-C to tagbar
" put lines below to ~/.vim/ctags-options-objc-source
" --langdef=objc
" --langmap=objc:.m.mm.h
" --regex-objc=/\@interface[[:space:]]+([[:alnum:]_]+)[[:space:]]*:/\1/i,interface/
" --regex-objc=/\@interface[[:space:]]+([[:alnum:]_]+)[[:space:]]*\(([[:alnum:]_]*)\)/\1(\2)/x,extension/
" --regex-objc=/\@implementation[[:space:]]+([[:alnum:]_]+)[[:space:]]*$/\1/I,implementation/
" --regex-objc=/\@implementation[[:space:]]+([[:alnum:]_]+)[[:space:]]*\(([[:alnum:]_]*)\)/\1(\2)/I,implementation/
" --regex-objc=/\@protocol[[:space:]]+([[:alnum:]_]+)/\1/P,protocol/
" --regex-objc=/\@property[[:space:]]*\([[:alnum:],=[:space:]]+\)*[[:space:]]+([^;]*)[[:space:]]+([[:alnum:]_]+)[[:space:]]*;$/\2/p,property/
" --regex-objc=/\@property[[:space:]]*\([[:alnum:],=[:space:]]+\)*[[:space:]]+[[:alnum:]]+[[:space:]]*<[[:alnum:]]+>[[:space:]]+([[:alnum:]_]+)/\1/p,property/
" --regex-objc=/^[[:space:]]*([-+])[[:space:]]*\([[:alpha:]_][^)]*\)[[:space:]]*(([[:alpha:]_][^:;{]+:?)(\([^)]+\)[[:alnum:]_]+[[:space:]\n]*)?){1,}/\1\3\6\9/M,method definition/
" --regex-objc=/^[^#@[:space:]][^=]*[[:space:]]([[:alpha:]_][[:alnum:]_]*)[[:space:]]*=/\1/c,constant/
" --regex-objc=/^[[:space:]]*typedef[[:space:]][^;]+[[:space:]]([[:alpha:]_][[:alnum:]]*)[[:space:]]*;/\1/t,typedef/
" --regex-objc=/[[:space:]]NS_ENUM\([[:alnum:]]+[[:space:]]*,[[:space:]]*([[:alnum:]]+)\)/\1/e,enumeration/
" --regex-objc=/^#pragma[[:space:]]+mark[[:space:]]+-?[[:space:]]+([[:alnum:][:space:]]+)/\1/g,pragma/
let g:tagbar_type_objc = {
  \ 'ctagstype': 'objc',
  \ 'ctagsargs': [
    \ '-f',
    \ '-',
    \ '--excmd=pattern',
    \ '--extra=',
    \ '--format=2',
    \ '--fields=nksaSmt',
    \ '--options=' . expand('~/.vim/ctags-options-objc-source'),
    \ '--objc-kinds=-N',
  \ ],
  \ 'sro': ' ',
  \ 'kinds': [
    \ 'c:constant',
    \ 'e:enum',
    \ 't:typedef',
    \ 'i:interface',
    \ 'P:protocol',
    \ 'p:property',
    \ 'I:implementation',
    \ 'M:method',
    \ 'g:pragma',
  \ ],
\ }

" markdown
NeoBundle 'gabrielelana/vim-markdown'

" check
NeoBundleCheck

" macvim
if has("gui_macvim")
  set transparency=10
  set guifont=PragmataPro:h12
  autocmd VimLeave * macaction terminate:
endif

" file type fix
let filetype_m = 'objc'
