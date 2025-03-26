#!/bin/env lua

vim.keymap.set({'v'}, '<A-Up>', '<Plug>MoveBlockUp')
vim.keymap.set({'v'}, '<A-Down>', '<Plug>MoveBlockDown')
vim.keymap.set({'v'}, '<A-Left>', '<Plug>MoveBlockLeft')
vim.keymap.set({'v'}, '<A-Right>', '<Plug>MoveBlockRight')

vim.keymap.set({'i'}, '<A-Up>', function() vim.cmd [[execute "normal \<Plug>MoveLineUp"]] end, { desc = "Move line up", silent = true })
vim.keymap.set({'i'}, '<A-Down>', function() vim.cmd [[execute "normal \<Plug>MoveLineDown"]] end, { desc = "Move line down", silent = true })

