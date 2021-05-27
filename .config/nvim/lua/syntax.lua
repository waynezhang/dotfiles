require('paq-nvim').paq 'sheerun/vim-polyglot'

require('paq-nvim').paq 'nvim-treesitter/nvim-treesitter'
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true
  }
}
