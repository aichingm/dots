#!/bin/env lua

-- tab bar
return {
  "romgrk/barbar.nvim",
  opts = {
    sidebar_filetypes = {
      ['neo-tree'] = {event = 'BufWipeout', text = 'Neo-Tree', align = 'center'},
    },
  },
}

