return {
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
        },
        view = {
          entries = "native"
        },
        sources = cmp.config.sources(
        { { name = 'nvim_lsp' } },
        { { name = 'buffer' } },
        { { name = 'vsnip' } }
        )
      })
    end
  },
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },
  { 'm4xshen/autoclose.nvim', config = function() require('autoclose').setup() end },
}
