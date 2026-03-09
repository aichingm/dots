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
        mappings = {
          ["O"] = {
            command = function(state)
              local filepath = state.tree:get_node().path
              local osType = os.getenv("OS")
              local command

              if osType == "Windows_NT" then
                command = "start " .. filepath
              elseif osType == "Darwin" then
                command = "open " .. filepath .. " 1>/dev/null 2>&1"
              else
                command = "xdg-open " .. filepath .. " 1>/dev/null 2>&1"
              end
              os.execute(command)
            end,
            desc = "open_with_system_defaults",
          },
        },
      },
    })
  end,
}

