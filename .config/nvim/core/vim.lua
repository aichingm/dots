#!/bin/env lua

-- Disable save by move (point filename to new inode), enable save in-place
vim.o.backupcopy = "yes"

-- Enable mouse mode
vim.o.mouse = 'nv'

vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

