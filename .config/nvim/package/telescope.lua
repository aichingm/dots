#!/bin/env lua

-- telescope
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        layout_strategy = 'vertical',
        layout_config = {
          vertical = { width = 0.75 }
        },
      },
    })
  end,
}

