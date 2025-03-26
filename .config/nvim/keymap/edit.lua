#!/bin/env lua

local mv = require("function.movment")

vim.keymap.set({'i'}, '<M-r>',
  function ()
    mv.begin_word(true)
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<esc>ve"hy<esc>:%s/<C-r>h/<C-r>h/g<left><left>', true, false, true)) -- escape, enter v mode, select to end of word, activate register h, yank, escape, substitute
  end,
  { desc = "Replace current word", silent = true }
)

vim.keymap.set({'n'}, '<M-r>',
  function ()
    mv.begin_word(false)
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('ve"hy<esc>:%s/<C-r>h/<C-r>h/g<left><left>', true, false, true)) -- escape, enter v mode, select to end of word, activate register h, yank, escape, substitute
  end,
  { desc = "Replace current word", silent = true }
)

vim.keymap.set({'v'}, '<M-r>',
  function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('"hy:%s/<C-r>h/<C-r>h/g<left><left>', true, false, true))
  end,
  { desc = "Replace selection", silent = true }
)

vim.keymap.set({'n'}, '<S-Tab>', '<<', { desc = "Unindent with shift tab", silent = true })

vim.keymap.set({'i'}, '<S-Tab>',
  function()
    local pos = vim.fn.col(".")
    local lineLength = string.len(vim.fn.getline("."))
    vim.fn.execute("normal <<")
    vim.fn.cursor(vim.fn.line("."), pos - (lineLength - string.len(vim.fn.getline("."))))
  end,
  { desc = "Unindent with shift tab", silent = true }
)

-- Save file
vim.keymap.set({'i'}, '<M-w>', '<esc>:w!<CR>a', { desc = "Save file", silent = true })
vim.keymap.set({'n'}, '<M-w>', '<esc>:w!<CR>', { desc = "Save file", silent = true })

