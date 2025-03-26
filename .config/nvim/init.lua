#!/bin/env lua
package.path = package.path .. ";" .. vim.fn.stdpath('config') .. "/?.lua"

require('core.leader')

require('core.lazy')
require('lazy').setup({
  require("package.barbar"),
  require("package.codewindow"),
  require("package.gitsigns"),
  require("package.indent-blankline"),
  require("package.lualine"),
  require("package.neo-tree"),
  require("package.nvim-cmp"),
  require("package.nvim-lspconfig"),
  require("package.nvim-notify"),
  require("package.nvim-treesitter"),
  require("package.outline"),
  require("package.telescope"),
  require("package.themes"),
  require("package.todo-comments"),
  require("package.toggleterm"),
  require("package.vim-move"),
  require("package.vim-sleuth"),
}, {})

-- More
-- Bookmarks https://github.com/tomasky/bookmarks.nvim
-- navigation https://github.com/ggandor/lightspeed.nvim
-- buffer window https://github.com/j-morano/buffer_manager.nvim
-- Command line https://github.com/folke/noice.nvim
-- Screenshot https://github.com/niuiic/code-shot.nvim
-- Bread crumbs https://github.com/utilyre/barbecue.nvim
-- Code runner https://github.com/desdic/greyjoy.nvim
-- Renaming https://github.com/filipdutescu/renamer.nvim
-- Folding https://github.com/anuvyklack/pretty-fold.nvim

require('core.vim')

require("keymap.buffer")
require("keymap.copy_paste")
require("keymap.delete")
require("keymap.edit")
require("keymap.lsp")
require("keymap.movment")
require("keymap.style")
require("keymap.telescope")
require("keymap.vim-move")
require("keymap.whitespace")

require("module.completion")
require("module.lsp")
require("module.movment")
require("module.scroll")
require("module.snippet")
require("module.spelling")
require("module.tabs")
require("module.whitespace")

require("style.vim")
require("style.theme")

