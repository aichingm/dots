#!/bin/env lua

-- Highlight
return {
 'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.configs").setup {
      -- check available languages at https://github.com/nvim-treesitter/nvim-treesitter
      ensure_installed = {
        "asm", "awk", "bash", "bibtex", "c", "cmake", "cpp", "c_sharp", "css", "csv", "devicetree", "diff", "dockerfile", "dot", "dtd", "ebnf", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "glsl", "go", "gomod", "gosum", "gowork", "gotmpl", "haskell", "haskell_persistent", "hcl", "html", "http", "ini", "java", "javascript", "jq", "jsdoc", "json", "json5", "jsonc", "jsonnet", "kconfig", "kotlin", "llvm", "lua", "make", "markdown", "markdown_inline", "mermaid", "nasm", "passwd", "pem", "php", "phpdoc", "po", "printf", "properties", "python", "ssh_config", "regex", "rst", "rust", "scss", "sql", "terraform", "toml", "typescript", "udev", "vim", "vue", "xml", "yaml"
        -- , "comment"
      },
      sync_install = true,
      auto_install = false,
      highlight = { enable = true, },
    }
  end
}

