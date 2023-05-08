require 'plugins.statusline'
require 'plugins.syntax'
require 'plugins.completion'
require 'plugins.lsp'
require 'plugins.git'
require 'plugins.flutter'

use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use 'nvim-telescope/telescope-symbols.nvim'
use 'jremmen/vim-ripgrep'
use 'thinca/vim-quickrun'
use 'joequery/Stupid-EasyMotion'
use 'yamatsum/nvim-cursorline'
use 'chrisbra/matchit'

use 'waynezhang/mdtodo.nvim'
require'mdtodo'.setup({})
vim.cmd([[
  let g:markdown_folding = 1
  au FileType markdown setlocal foldlevel=99

  let g:vim_markdown_auto_insert_bullets = 0
  let g:vim_markdown_new_list_item_indent = 0
]])
