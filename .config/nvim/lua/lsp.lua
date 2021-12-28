require('paq-nvim').paq 'neovim/nvim-lspconfig'
require('paq-nvim').paq 'williamboman/nvim-lsp-installer'

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)
