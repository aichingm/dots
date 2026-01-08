#!/bin/env lua

vim.o.background = "dark"
vim.cmd("colorscheme kanagawa") -- needed for initial reset
vim.cmd("colorscheme nordfox")

local csDark = {
  "kanagawa",
  "nightfox",
  "duskfox",
  "nordfox",
  "terafox",
  "carbonfox",
  "accent",
  "atlas",
  "fogbell",
  "abscs",
  "melange",
  "miasma",
}

local csLight = {
  "dayfox",
  "dawnfox",
  "monochromenote",
  "fogbell_light",
}

local csDarkIndex = 0
local csLightIndex = 0
local csCurrentDark = true

local cycle_dark = function()
  if csCurrentDark then
    csDarkIndex = (csDarkIndex + 1) % table.getn(csDark)
  else
    csCurrentDark = true
  end
  --vim.o.background = "dark"
  local s = csDark[csDarkIndex + 1]
  vim.cmd("colorscheme " .. s)
  require("notify")("Color: " .. s)
end

local cycle_light = function()
  if csCurrentDark then
    csCurrentDark = false
  else
    csLightIndex = (csLightIndex + 1) % table.getn(csLight)
  end
  local s = csLight[csLightIndex + 1]
  --vim.o.background = "light"
  vim.cmd("colorscheme " .. s)
  require("notify")("Color: " .. s)
end

return {
  cycle_dark = cycle_dark,
  cycle_light = cycle_light,
}
