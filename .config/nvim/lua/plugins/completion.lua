use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/nvim-cmp'

local cmp = require'cmp'
cmp.setup({
    view = {
      entries = "native"
    },
    sources = cmp.config.sources(
      { { name = 'nvim_lsp' } },
      { { name = 'buffer' } }
    )
})
