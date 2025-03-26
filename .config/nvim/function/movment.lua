#!/bin/env lua

function begin_word (offsetInsertMode)
  local pos = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local char = vim.fn.strpart(line, pos - 1, 1, 1)
  if string.match(char, '[%a%d]') then
    while string.match(char, '[%a%d]') do
      pos = pos - 1
      char = vim.fn.strpart(line, pos - 1, 1, 1)
    end
    if offsetInsertMode then
      vim.fn.cursor(vim.fn.line("."), pos + 2)
    else
      vim.fn.cursor(vim.fn.line("."), pos + 1)
    end
  end
end

function end_word ()
  local pos = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local char = vim.fn.strpart(line, pos - 1, 1, 1)
  if string.match(char, '[%a%d]') then
    while string.match(char, '[%a%d]') do
      pos = pos + 1
      char = vim.fn.strpart(line, pos - 1, 1, 1)
    end
    if vim.fn.mode() == 'i' then
      vim.fn.cursor(vim.fn.line("."), pos)
    else
      vim.fn.cursor(vim.fn.line("."), pos - 1)
    end
  end
end

return {
  begin_word = begin_word,
  end_word = end_word,
}
