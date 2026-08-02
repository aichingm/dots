#!/bin/env lua

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    require("keymap.lsp").setup(opts)
  end,
})

vim.api.nvim_create_user_command('LspRestart', function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    client.stop()
  end
  vim.cmd('edit')
end, {})

