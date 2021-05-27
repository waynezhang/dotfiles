require('paq-nvim').paq { 'nanotech/jellybeans.vim', as = 'jellybeans' }

require('common').set_options({
  -- color cursorline = true,
})

vim.api.nvim_command([[
  augroup ChangeBackgroudColour
    autocmd colorscheme * :highlight normal ctermbg=none
    autocmd colorscheme * :highlight NonText ctermbg=none
    autocmd colorscheme * :highlight CursorLine cterm=none ctermbg=236
    autocmd colorscheme * :highlight SignColumn ctermbg=black
    autocmd colorscheme * :highlight SignifySignAdd ctermbg=black ctermfg=green
    autocmd colorscheme * :highlight SignifySignDelete ctermbg=black ctermfg=red
    autocmd colorscheme * :highlight SignifySignChange ctermbg=black ctermfg=yellow
  augroup END
]])
vim.cmd('silent! colorscheme jellybeans')
