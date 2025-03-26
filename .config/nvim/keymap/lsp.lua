#!/bin/env lua

local setup = function(opts)
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>H', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    -- LSP actions
    vim.keymap.set('n', '<leader>ar', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ac', vim.lsp.buf.code_action, opts)
    vim.keymap.set({ 'n' }, '<leader>ad', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<leader>af', function()
      vim.lsp.buf.format { async = true }
    end, opts)
end

return { setup = setup }
