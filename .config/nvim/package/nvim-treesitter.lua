#!/bin/env lua

-- Highlight
return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  lazy = false,
  config = function()

    require("nvim-treesitter.install").prefer_git = true

    local ts = require("nvim-treesitter")
    ts.setup {
      install_dir = vim.fn.stdpath('data') .. '/site'
    }

    local languages = { "asm", "awk", "bash", "bibtex", "c", "cmake", "cpp", "c_sharp", "css", "csv", "devicetree", "diff", "dockerfile", "dot", "dtd", "ebnf", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "glsl", "go", "gomod", "gosum", "gowork", "gotmpl", "haskell", "haskell_persistent", "hcl", "html", "http", "ini", "java", "javascript", "jq", "jsdoc", "json", "json5", "jsonnet", "kconfig", "kotlin", "llvm", "lua", "make", "markdown", "markdown_inline", "mermaid", "nasm", "passwd", "pem", "php", "phpdoc", "po", "printf", "properties", "python", "ssh_config", "regex", "rst", "rust", "scss", "sql", "terraform", "toml", "typescript", "udev", "vim", "vue", "xml", "yaml" }

    local ignore_filetype = {
        "checkhealth",
        "lazy",
        "mason",
        "snacks_dashboard",
        "snacks_notif",
        "snacks_win",
        "snacks_input",
        "snacks_picker_input",
        "TelescopePrompt",
        "alpha",
        "dashboard",
        "spectre_panel",
        "NvimTree",
        "undotree",
        "Outline",
        "sagaoutline",
        "copilot-chat",
        "vscode-diff-explorer",
      }

    require('nvim-treesitter').install(languages):wait(300000)

    local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      desc = "Enable TreeSitter highlighting and indentation",
      callback = function(ev)
        local ft = ev.match

        if vim.tbl_contains(ignore_filetype, ft) then
          return
        end

        local lang = vim.treesitter.language.get_lang(ft) or ft
        local buf = ev.buf
        pcall(vim.treesitter.start, buf, lang)

        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
      })
  end
}

