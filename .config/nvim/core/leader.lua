#!/bin/env lua

vim.g.mapleader = ' '
vim.g.maplqocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Set <Leader> timings
vim.o.updatetime = 250
vim.o.timeoutlen = 400

