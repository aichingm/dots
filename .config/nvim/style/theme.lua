#!/bin/env lua

local csDark = {
  "nightfox",
  "duskfox",
  "nordfox",
  "terafox",
  "carbonfox",
}

local csLight = {
  "dayfox",
  "dawnfox",
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
