#!/bin/env lua

-- lsp
return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')
    lspconfig.gopls.setup{
      settings = {
        gopls = {
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    }
    lspconfig.clangd.setup{}
  end,
}
