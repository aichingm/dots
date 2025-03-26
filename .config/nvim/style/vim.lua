#!/bin/env lua

-- hide current mode
--vim.o.showmode = false
--vim.o.ruler = false
--vim.o.showcmd = false
vim.o.cmdheight = 0
vim.opt.laststatus = 0

-- highlight current line
vim.o.cursorline = true

-- blinking cursor
-- https://stackoverflow.com/a/63924002
-- vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"

-- Set highlight on search
vim.o.hlsearch = false

-- Enable line numbers
vim.wo.number = true
vim.o.relativenumber = true


