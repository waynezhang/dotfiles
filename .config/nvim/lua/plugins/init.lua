return {
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-telescope/telescope-symbols.nvim' },
  {
    'kyoh86/vim-ripgrep', config = function()
      vim.api.nvim_create_user_command(
      'Rg',
      function(opts)
        local arg = opts.args
        if(arg == '') then
          arg = vim.fn['expand']('<cword>')
        end
        vim.fn['ripgrep#search'](arg)
      end,
      { nargs = '*' }
      )
    end
  },
  { 'phaazon/hop.nvim', config = function() require'hop'.setup() end },
  {
    'yamatsum/nvim-cursorline', config = function()
      require('nvim-cursorline').setup {
        cursorword = { enable = true }
      }
    end
  },
  { 'chrisbra/matchit' }
}
