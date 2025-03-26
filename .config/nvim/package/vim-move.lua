#!/bin/env lua

-- Move lines/selection
return {
  'matze/vim-move',
  init = function()
    -- disable default key bindings
    vim.g.move_map_keys = 0
  end,
}

