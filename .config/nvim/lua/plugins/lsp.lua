return {
  {
    'folke/neodev.nvim',
    config = function() require('neodev').setup({}) end,
    dependencies = { 'neovim/nvim-lspconfig' }
  },
  { 'williamboman/mason.nvim', config = function() require('mason').setup() end },
  {
    'williamboman/mason-lspconfig.nvim', config = function()
      require('mason-lspconfig').setup()

      local nvim_lsp = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup_handlers({
        function(server_name)
          local opts = {}
          opts.on_attach = function(_, bufnr)
            local function set_normal_keymap(from, to)
              local opts = { noremap = true, silent = true }
              vim.api.nvim_buf_set_keymap(bufnr, 'n', from, '<cmd> lua '..to..'<CR>', opts)
            end

            set_normal_keymap('gD', 'vim.lsp.buf.declaration()')
            set_normal_keymap('gd', 'vim.lsp.buf.definition()')
            set_normal_keymap('K', 'vim.lsp.buf.hover()')
            set_normal_keymap('gi', 'vim.lsp.buf.implementation()')
            set_normal_keymap('<C-k>', 'vim.lsp.buf.signature_help()')
            set_normal_keymap('<space>wa', 'vim.lsp.buf.add_workspace_folder()')
            set_normal_keymap('<space>wr', 'vim.lsp.buf.remove_workspace_folder()')
            set_normal_keymap('<space>wl', 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))')
            set_normal_keymap('<space>D', 'vim.lsp.buf.type_definition()')
            set_normal_keymap('<space>rn', 'vim.lsp.buf.rename()')
            set_normal_keymap('<space>ca', 'vim.lsp.buf.code_action()')
            set_normal_keymap('gr', 'vim.lsp.buf.references()')
            set_normal_keymap('<space>f', 'vim.lsp.buf.formatting()')
          end
          nvim_lsp[server_name].setup(opts)
        end
      })
    end
  },
  { 'neovim/nvim-lspconfig' },
  { 'mfussenegger/nvim-dap' },
  { 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons'}},
}
