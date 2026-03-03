
vim.lsp.config('gopls', {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
        usePlaceholders = true,
      },
      analyses = {
        unusedparams = true,
      },
      buildFlags = { "" },
    },
  },
})

vim.lsp.config('serve_d', {
  cmd = { "serve-d" },
  filetypes = {  "d" },
  root_markers = { "dub.json", "dub.sdl", ".git" },
  settings = {
    dfmt = {
      braceStyle = "otbs",
    },
  }
})

vim.lsp.enable('gopls')
vim.lsp.enable('clangd')
vim.lsp.enable('serve_d')

