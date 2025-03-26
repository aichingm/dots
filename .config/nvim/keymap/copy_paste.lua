#!/bin/env lua

vim.keymap.set({'n', 'i'}, '<M-y>', function()
  local pos = vim.fn.col(".")
  vim.fn.execute("normal 0y$")
  vim.fn.cursor(vim.fn.line("."), pos)
end, { desc = "Yank whole line", silent = true })

vim.keymap.set({'n', 'i'}, '<M-p>', function ()
  local pos = vim.fn.col(".")
  local epos = vim.fn.col("$")

  if epos == 1 then
    -- require('notify')("line is empty")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col("$"))
  elseif pos == epos then
    -- require('notify')("at end")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col("$"))
  elseif pos == 1 then
    -- require('notify')("at start")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col(".")+1)
  else
    -- require('notify')("in middle")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col(".")+1)
  end
end , { desc = "Paste default buffer", silent = true })

vim.keymap.set('n', 'p', function ()
  local pos = vim.fn.col(".")
  local epos = vim.fn.col("$")

  if epos == 1 then
    -- require('notify')("line is empty")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col("$"))
  elseif pos == epos then
    -- require('notify')("at end")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col("$"))
  elseif pos == 1 then
    -- require('notify')("at start")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col(".")+1)
  else
    -- require('notify')("in middle")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col(".")+1)
  end
end , { desc = "Paste default buffer", silent = true })



