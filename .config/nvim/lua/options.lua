require('common').set_options({
  -- basic editing
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  number = true,
  scrolloff = 3,
  clipboard = 'unnamed',
  -- search
  ignorecase = true,
  smartcase = true,
  -- no backup
  swapfile = false,
  backup = false,
  writebackup = false,
})

-- Objective C file type fix
vim.cmd("let filetype_m = 'objc'")
