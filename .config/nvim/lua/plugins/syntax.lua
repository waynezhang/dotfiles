use 'sheerun/vim-polyglot'
use 'nvim-treesitter/nvim-treesitter'
use 'godlygeek/tabular'

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'javascript', 'swift', 'bash', 'java', 'kotlin', 'lua', 'markdown', 'json', 'html', 'go', 'gitignore', 'gitcommit', 'diff', 'css', 'dart' },
  highlight = {
    enable = true,
  }
}
