return {
  {
    'CRAG666/code_runner.nvim',
    config = function()
      require('code_runner').setup({
        filetype = {
          python = "python3 -u \"$fileName\"",
          typescript = "deno run",
          swift = "swift",
        },
      })
    end
  }
}
