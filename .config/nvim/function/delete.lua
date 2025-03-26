#!/bin/env lua

local word_forward = function ()
  local pos = vim.fn.col(".")
  local epos = vim.fn.col("$")
  local line = vim.fn.getline(".")
  local nextChar = vim.fn.strpart(line, vim.fn.col(".")-1, 1, 1)
  local deleteMatch = function(str, pos, regex)
    local rest = string.sub(str, pos)
    local match = string.match(rest, regex)
    local newStr = string.sub(str, 0, pos-1) .. string.sub(rest, string.len(match)+1)
    return newStr
  end

  if epos == 1 or pos == epos then
     vim.fn.execute('normal gJ')
     vim.fn.cursor(vim.fn.line("."), pos)
  elseif string.match(nextChar, '[%a%d]') then
    vim.fn.setline(".", deleteMatch(line, pos, '[%a%d]*'))
  elseif string.match(nextChar, '[%s]') then
    vim.fn.setline(".", deleteMatch(line, pos, '[%s]*'))
  elseif string.match(nextChar, '[%p]') then
    vim.fn.setline(".", deleteMatch(line, pos, '[%p]*'))
  else
    vim.fn.setline(".", string.sub(line, 0, pos-1) .. string.sub(line, pos+1))
  end
end

local word_backward = function ()
  local pos = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local prevChar = vim.fn.strpart(line, vim.fn.col(".")-2, 1, 1)
  local deleteMatch = function(str, pos, regex)
    local start = string.sub(str, 0, pos-1)
    local match = string.match(start, regex)
    return string.sub(start, 0, pos-string.len(match)-1) .. string.sub(str, pos)
  end

  if pos == 1 or pos == 0 then
    vim.fn.execute('normal h$Jx')
    vim.fn.cursor(vim.fn.line("."), pos)
  elseif string.match(prevChar, '[%a%d]') then
    vim.fn.setline(".", deleteMatch(line, pos, '[%a%d]*$'))
  elseif string.match(prevChar, '[%s]') then
    vim.fn.setline(".", deleteMatch(line, pos, '[%s]*$'))
  elseif string.match(prevChar, '[%p]') then
    vim.fn.setline(".", deleteMatch(line, pos, '[%p]*$'))
  else
    require("notify")("what just happened?")
    -- delete from the end of this line ü
    -- delete from the end of this line ↰
    return nil
  end

  vim.fn.cursor(vim.fn.line("."), pos-(string.len(line) - string.len(vim.fn.getline("."))))
end

return {
  word_forward = word_forward,
  word_backward = word_backward,
}

