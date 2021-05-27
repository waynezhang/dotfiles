require('paq-nvim').paq 'neovim/nvim-lspconfig'

require('lspconfig').sourcekit.setup {}
require('lspconfig').pyright.setup {}
require('lspconfig').tsserver.setup {}

local sumneko_root_path = vim.fn.expand('$HOME') .. '/Projects/lua-language-server'
require('lspconfig').sumneko_lua.setup {
  cmd = {
    sumneko_root_path .. '/bin/macOS/lua-language-server',
    '-E',
    sumneko_root_path .. '/main.lua'
  },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
