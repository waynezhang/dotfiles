set nocompatible

" package
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

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
NeoBundle 'terryma/vim-powerline', {'rev':'develop'}
set t_Co=256 
let g:Powerline_symbols = 'fancy' 
set laststatus=2

" outline
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
map <C-\> :Unite outline<CR>

" Code completion
" NeoBundle'Shougo/neocomplcache'
" set lazyredraw
" let g:acp_enableAtStartup = 0
" let g:neocomplcache_enable_at_startup = 1 
" let g:neocomplcache_enable_smart_case = 1
" let g:neocomplcache_enable_camel_case_completion = 1
" let g:neocomplcache_enable_underbar_completion = 1
" let g:neocomplcache_enable_auto_select = 1
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_min_keyword_length = 3
" let g:neocomplcache_max_list=10

" NeoBundle 'Valloric/YouCompleteMe'

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

" tab
nnoremap <C-t><C-n> :tabnew<cr>
nnoremap <C-t><C-w> :tabclose<cr>
nnoremap <C-t><C-j> :tabprev<cr>
nnoremap <C-t><C-k> :tabnext<cr>

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
let g:ctrlp_map = '<C-P>'


" ack
NeoBundle 'mileszs/ack.vim'
nnoremap <C-a> :Ack<space>

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

" lisp
NeoBundle 'https://bitbucket.org/kovisoft/slimv'
let g:slimv_disable_clojure=1 " disable for clojure since slimv has conflict with ack, ctrlp, command-t ........

" Clojure
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'ssh://hg@bitbucket.org/kovisoft/paredit'
NeoBundle 'jebberjeb/vim-clojure-conceal'

NeoBundle 'tpope/vim-surround'

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

" markdown
" [sudo] gem install redcarpet pygments.rb
" [sudo] npm -g install instant-markdown-d
" [sudo] chmod ugo-x /usr/libexec/path_helper
NeoBundle 'suan/vim-instant-markdown'

" compile and run
NeoBundle 'xuhdev/SingleCompile'
call SingleCompile#SetCompilerTemplate('objc', 'clang',
      \ 'the Clang C and Objective-C compiler', 'clang',
      \ '-F /System/Library/Frameworks -lobjc -framework Cocoa -framework Foundation -g -o $(FILE_TITLE)$', g:SingleCompile_common_run_command)
call SingleCompile#SetPriority('objc', 'clang', 70)
nmap <Leader>r :SCCompileRun<cr>

" snip
" NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/neosnippet.vim'

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

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
