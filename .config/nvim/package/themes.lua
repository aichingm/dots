#!/bin/env lua

-- theme
return {
  "EdenEast/nightfox.nvim",
  config = function()
    vim.o.background = "dark"
    vim.cmd("colorscheme nordfox")
  end,
}
