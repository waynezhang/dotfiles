use 'nanotech/jellybeans.vim'

vim.g.jellybeans_overrides = {
	background = { guibg = 'none' },
	Visual = { guibg = '5050505' },
	LineNr = { guifg = '696969' },
	NonText = { guifg = '696969' },
	SignifySignAdd = { guifg = '00ff00' },
	SignifySignDelete = { guifg = 'ff0000' },
	SignifySignChange = { guifg = 'ffff00' },
}
if vim.fn.has("gui_vimr") > 0 then
	vim.cmd('silent! colorscheme desert')
else
	vim.cmd('silent! colorscheme jellybeans')
end
