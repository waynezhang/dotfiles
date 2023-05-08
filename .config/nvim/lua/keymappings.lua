local set_keymap = require('common').set_keymap

vim.g.mapleader = ","

set_keymap('n', '<c-p>', ':Telescope find_files<cr>')
set_keymap('n', '<c-e>', ':Rg ')
set_keymap('n', '<Leader>r', ':RunCode<cr>')
set_keymap('n', '<Leader><Leader>w', ':HopChar1<cr>')
