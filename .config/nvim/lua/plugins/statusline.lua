return {
  {
    'hoob3rt/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
        },
      }
    end
  }
}

