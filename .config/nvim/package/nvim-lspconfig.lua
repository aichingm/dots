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
    -- git clone https://github.com/Pure-D/serve-d; cd serve-d; dub build; mv serve-d ~/.local/bin
    lspconfig.serve_d.setup({
	settings = {
		dfmt = {
			braceStyle = "otbs",
		},
	},
})
  end,
}
