#!/bin/env lua

-- Split buffer
vim.keymap.set({'n'}, '<Leader>-', ':sp<CR>', { desc = "Split window horizontally", silent = true })
vim.keymap.set({'n'}, '<Leader>7', ':vsp<CR>', { desc = "Split window vertically", silent = true })

-- Buffers
vim.keymap.set({'n', 'i'}, '<M-PageUp>', ':bprevious<CR>', { desc = "Show previous buffer", silent = true })
vim.keymap.set({'n', 'i'}, '<M-PageDown>', ':bnext<CR>', { desc = "Show next buffer", silent = true })
vim.keymap.set({'n', 'i'}, '<M-q>', '<esc>:BufferClose<CR>', { desc = "Close barbar tab", silent = true })

vim.keymap.set({'n'}, '<Leader><PageUp>', ':bprevious<CR>', { desc = "Show previous buffer", silent = true })
vim.keymap.set({'n'}, '<Leader><PageDown>', ':bnext<CR>', { desc = "Show next buffer", silent = true })

vim.keymap.set({'n'}, '<Leader><Left>', '<C-w><Left>', { desc = "Focus left window", silent = true })
vim.keymap.set({'n'}, '<Leader><Up>', '<C-w><Up>', { desc = "Focus top window", silent = true })
vim.keymap.set({'n'}, '<Leader><Right>', '<C-w><Right>', { desc = "Focus right window", silent = true })
vim.keymap.set({'n'}, '<Leader><Down>', '<C-w><Down>', { desc = "Focus down window", silent = true })

