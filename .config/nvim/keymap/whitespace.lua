#!/bin/env lua

vim.keymap.set({'n'}, '<Leader>vs',
  function()
    vim.o.list = not vim.o.list
  end,
  { silent = true, desc = "Toggle whitespace" }
)

