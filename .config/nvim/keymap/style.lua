#!/bin/env lua

local theme = require("style.theme")

vim.keymap.set({'n'}, '<Leader>vl', function()
  if vim.o.laststatus == 0 then
    vim.opt.laststatus = 2
  else
    vim.opt.laststatus = 0
  end
end, { silent = true, desc = "Toggle status line" })

vim.keymap.set({'n'}, '<Leader>vn', function()
  vim.wo.number        = not vim.wo.number
  vim.o.relativenumber = not vim.o.relativenumber
end, { silent = true, desc = "Toggle line numbers" })

vim.keymap.set({'n'}, '<Leader>ü', theme.cycle_dark, { silent = true, desc = "Switch to dark color scheme" })
vim.keymap.set({'n'}, '<Leader>ä', theme.cycle_light, { silent = true, desc = "Switch to light color scheme" })

