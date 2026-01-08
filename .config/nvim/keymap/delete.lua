#!/bin/env lua

local del = require("function.delete")

vim.keymap.set('i', '<C-Del>',
  function()
   del.word_forward()
  end,
  { desc = "Delete word forward", silent = true }
)

vim.keymap.set('i', '<C-h>',
  function ()
    del.word_backward()
  end,
  { desc = "Delete word backwords", silent = true }
)

vim.keymap.set('i', '<C-BS>',
  function ()
    del.word_backward()
  end,
  { desc = "Delete word backwords", silent = true }
)

