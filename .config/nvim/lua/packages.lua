local install_path = vim.fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/savq/paq-nvim.git', install_path})
end

vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq { 'savq/paq-nvim', opt = true }

-- git
paq 'tpope/vim-fugitive'
paq 'mhinz/vim-signify'
-- search
paq 'jremmen/vim-ripgrep'
-- quick run
paq 'thinca/vim-quickrun'
-- other
paq 'joequery/Stupid-EasyMotion'
-- telescope
paq 'nvim-lua/popup.nvim'
paq  'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'
-- matches
paq 'gregsexton/MatchTag'
paq 'adelarsq/vim-matchit'
-- indent
paq 'Yggdroot/indentLine'
paq 'lukas-reineke/indent-blankline.nvim'
vim.g.indentLine_char = '|'
-- others
paq 'yamatsum/nvim-cursorline'
