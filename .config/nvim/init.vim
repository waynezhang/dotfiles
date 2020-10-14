if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

" lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'ryanolsonx/vim-lsp-typescript'
set omnifunc=lsp#complete

" motion
Plug 'joequery/Stupid-EasyMotion'
let g:mapleader = ","

" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" File finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
let $FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --exclude tulsi-workspace --color=always'
nnoremap <C-p> :FZF<cr>

Plug 'junegunn/fzf.vim'
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" ack
Plug 'jremmen/vim-ripgrep'
nnoremap <C-e> :Rg<space>

" run
Plug 'thinca/vim-quickrun'
nmap <Leader>r :QuickRun<cr>
let g:quickrun_config = {}
let g:quickrun_config['typescript'] = { 'type' : 'typescript/tsc' }
let g:quickrun_config['typescript/tsc'] = {
\   'command': 'tsc',
\   'exec': ['%c --target esnext --module commonjs --esModuleInterop %o %s', 'node %s:r.js'],
\   'tempfile': '%{tempname()}.ts',
\   'hook/sweep/files': ['%S:p:r.js'],
\ }

Plug 'guns/xterm-color-table.vim' " color
Plug 'gregsexton/MatchTag', { 'for': [ 'html', 'xml' ] } " html tag
Plug 'vim-scripts/matchit.zip' " % match
Plug 'sheerun/vim-polyglot' " language pack

Plug 'w0rp/ale' " lint

Plug 'nanotech/jellybeans.vim', { 'as': 'jellybeans' }

Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
let g:indentLine_char = '|'

Plug 'terryma/vim-expand-region'

Plug 'ianding1/leetcode.vim'
let g:leetcode_solution_filetype='javascript'
let g:leetcode_username="linghua.zhang@me.com"

Plug 'will133/vim-dirdiff'

call plug#end()

filetype plugin indent on
syntax on 
set tabstop=2
set shiftwidth=2
set nu
set wildmenu
set wildignorecase
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
set inccommand=split
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
hi Normal ctermbg=none
hi NonText ctermbg=none
hi CursorLine cterm=none ctermbg=236
highlight SignColumn ctermbg=black
highlight SignifySignAdd ctermbg=black ctermfg=green
highlight SignifySignDelete ctermbg=black ctermfg=red
highlight SignifySignChange ctermbg=black ctermfg=yellow
