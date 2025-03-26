#!/bin/env lua

-- spell checking
vim.o.spell = false
vim.o.spelllang = "en_us"

vim.keymap.set({'n'}, '<Leader>vw', function()
  vim.o.spell = not vim.o.spell
end, { silent = true, desc = "Toggle spell checking" })


