#!/bin/env lua

-- status
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",
  opts = function(_, opts)
    return { theme = 'gruvbox' }
  end,
}

