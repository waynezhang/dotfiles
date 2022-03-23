use 'sheerun/vim-polyglot'
use 'nvim-treesitter/nvim-treesitter'
use 'godlygeek/tabular'

require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true
  }
}
