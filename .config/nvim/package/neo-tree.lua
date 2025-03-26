#!/bin/env lua

-- file explorer
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<Leader>e', ':Neotree toggle=true<CR>', { desc = "Toggle explorer", silent = true })
    vim.keymap.set('n', '<Leader>ef', ':Neotree action=focus<CR>', { desc = "Focus explorer", silent = true })

    require("neo-tree").setup({
      opts = {
        sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      },
      window = {
        width = 35,
      },
    })
  end,
}

