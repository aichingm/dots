#!/bin/env lua

local telescope_builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fk', telescope_builtin.keymaps, {})
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fr', telescope_builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fi', telescope_builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>fd', telescope_builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>fD', telescope_builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', {})
vim.keymap.set('n', '<leader>fT', function() vim.fn.execute(':TodoTelescope cwd=' .. vim.fn.expand('%:p')) end, {})
vim.keymap.set('n', '<leader>fs', telescope_builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fe', function()telescope_builtin.diagnostics({bufnr=0})end, {})

