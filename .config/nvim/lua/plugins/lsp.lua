use 'williamboman/nvim-lsp-installer'
use 'neovim/nvim-lspconfig'

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_installer = require 'nvim-lsp-installer'
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    server:setup(opts)
end)
