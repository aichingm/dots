#!/bin/env lua

-- tab bar
return {
  "romgrk/barbar.nvim",
  opts = {
    sidebar_filetypes = {
      ['neo-tree'] = {event = 'BufWipeout', text = 'Files', align = 'center'},
    },
  },
}

