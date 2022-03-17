use 'williamboman/nvim-lsp-installer'
use 'neovim/nvim-lspconfig'

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_installer = require 'nvim-lsp-installer'
lsp_installer.on_server_ready(function(server)
    local opts = { capabilities = capabilities }
    server:setup(opts)
end)
