#!/bin/env lua

-- indentation rails
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").update {
      enabled = false,
      indent = {
        --char = "│",
        char = "▎",
      },
      whitespace = {
        remove_blankline_trail = false,
      },
      scope = {
        show_start = false,
        show_end = false,
      },
    }
    vim.keymap.set({'n'}, '<Leader>vi', function() vim.fn.execute("IBLToggle") end, { silent = true, desc = "Toggle indentation rails" })
  end,
}

