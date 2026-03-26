#!/bin/env lua

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.api.nvim_get_option_value('filetype', { buf = 0 }) == "neo-tree" then
      vim.wo.statusline = " "
    end
  end,
})

-- status
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",
  opts = {
    options = {
      theme = 'nord',
      disabled_filetypes = {
        statusline = { "neo-tree"},
        winbar = { "neo-tree" },
      }
    }
  }
}



