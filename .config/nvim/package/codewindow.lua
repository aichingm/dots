#!/bin/env lua

-- minimap (toggle <leader>vm, toggle focus <leader>vmf
return {
  'gorbit99/codewindow.nvim',
  config = function()
    local codewindow = require('codewindow')
    codewindow.setup({
      minimap_width = 10,
    })
    vim.keymap.set('n', '<leader>vm', codewindow.toggle_minimap, { desc = 'Toggle minimap', silent = true })
    vim.keymap.set('n', '<leader>vmf', codewindow.toggle_focus, { desc = 'Toggle minimap focus', silent = true })
  end,
}

