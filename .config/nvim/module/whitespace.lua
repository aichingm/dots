#!/bin/env lua
-- show whitespace
vim.o.list = false

-- only use whitespace settings in file buffers
vim.api.nvim_create_autocmd({'BufRead'}, {
    group = vim.api.nvim_create_augroup('HighlightGroup', {}),
    callback = function(ev)
      if ev.file ~= nil and ev.file ~= '' then
        -- require("notify")(ev.file .. " : " .. vim.bo[ev.buf].buftype .. "|" .. vim.api.nvim_buf_get_option(ev.buf, 'buftype'))

        vim.opt.listchars:append "tab:-->"
        vim.opt.listchars:append "trail:·"
        vim.opt.listchars:append "space:⋅"
        vim.opt.listchars:append "eol:↴"

        -- highlight trailing whitespace
        vim.cmd('match ExtraWhitespace /\\s\\+$/')
        vim.cmd('highlight ExtraWhitespace ctermbg=DarkRed guibg=DarkRed guifg=LightRed')
      end
    end,
  }
)

