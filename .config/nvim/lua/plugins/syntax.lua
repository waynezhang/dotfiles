use 'sheerun/vim-polyglot'
use 'nvim-treesitter/nvim-treesitter'

require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true
  }
}
