#!/bin/env lua

-- outline
return {
  'stevearc/aerial.nvim',
  opts = {},
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require('aerial').setup()
    vim.keymap.set('n', '<leader>vo', '<cmd>AerialToggle!<CR>')
  end,
}

