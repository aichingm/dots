#!/bin/env lua

local mv = require("function.movment")

-- if cursor is at ^ keep it at ^ instead of putting it at $
vim.keymap.set({'n'}, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({'n'}, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({'n'}, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({'n'}, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('i', '<Down>', '<cmd>norm! gj<cr>', { silent = true })
vim.keymap.set('i', '<Up>', '<cmd>norm! gk<cr>', { silent = true })

vim.keymap.set({'n', 'i', 'v'}, '<M-b>',
  function()
    mv.begin_word(false)
  end,
  { desc = "Jump to begin of current word", silent = true }
)

vim.keymap.set({'n', 'i', 'v'}, '<M-e>',
  mv.end_word,
  { desc = "Jump to end of current word", silent = true }
)

vim.keymap.set({'i', 'n', 'v'}, '<PageDown>',
  function()
    vim.fn.execute("normal ".. math.floor(vim.fn.winheight(".") / 3) .. "j")
  end,
  { silent = true }
)

vim.keymap.set({'i', 'n', 'v'}, '<PageUp>',
  function()
    vim.fn.execute("normal ".. math.floor(vim.fn.winheight(".") / 3) .. "k")
  end,
  { silent = true }
)

vim.keymap.set({'n', 'v'}, '<Home>',
  function()
    local pos = vim.fn.col(".")
    local line = vim.fn.getline(".")
    local left = vim.fn.strpart(line, 0, pos-1, 1)
    if string.match(left, '^[%s]*$') then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes('0', true, false, true))
    else
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes('^', true, false, true))
    end
  end,
  { desc = "Pos1 with detour", silent = true }
)

vim.keymap.set({'i'}, '<Home>',
  function()
    local pos = vim.fn.col(".")
    local line = vim.fn.getline(".")
    local left = vim.fn.strpart(line, 0, pos-1, 1)
    if string.match(left, '^[%s]*$') then
      vim.fn.cursor(vim.fn.line("."), 1)
    else
      local s, e = string.find(left, '^[%s]*')
      vim.fn.cursor(vim.fn.line("."), e + 1)
    end
  end,
  { desc = "Pos1 with detour", silent = true }
)

