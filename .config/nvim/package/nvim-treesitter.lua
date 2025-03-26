#!/bin/env lua

-- Highlight
return {
 'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "ada", "agda", "arduino", "astro", "awk", "bash", "bass", "beancount", "bibtex", "bicep", "blueprint", "c", "c_sharp", "cairo", "capnp", "chatito", "clojure", "cmake", "commonlisp", "cooklang", "corn", "cpon", "cpp", "css", "cuda", "cue", "dart", "devicetree", "dhall", "diff", "dockerfile", "dot", "ebnf", "eex", "elixir", "elm", "elsa", "elvish", "embedded_template", "erlang", "fennel", "firrtl", "fish", "foam", "fortran", "fsh", "func", "fusion", "gdscript", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "gleam", "glimmer", "glsl", "go", "godot_resource", "gomod", "gosum", "gowork", "graphql", "groovy", "hack", "hare", "haskell", "haskell_persistent", "hcl", "heex", "hjson", "hlsl", "hocon", "hoon", "html", "htmldjango", "http", "hurl", "ini", "ispc", "janet_simple", "java", "javascript", "jq", "jsdoc", "json", "json5", "jsonc", "jsonnet", "julia", "kdl", "kotlin", "lalrpop", "ledger", "llvm", "lua", "luadoc", "luap", "luau", "m68k", "make", "markdown", "markdown_inline", "matlab", "menhir", "mermaid", "meson", "nickel", "ninja", "nix", "norg", "objc", "ocaml", "ocaml_interface", "odin", "org", "pascal", "passwd", "pem", "perl", "php", "phpdoc", "pioasm", "po", "poe_filter", "pony", "prisma", "promql", "proto", "prql", "pug", "puppet", "python", "ql", "qmldir", "qmljs", "query", "r", "racket", "rasi", "regex", "rego", "rnoweb", "robot", "ron", "rst", "ruby", "rust", "scala", "scheme", "scss", "slint", "smali", "smithy", "solidity", "sparql", "sql", "squirrel", "starlark", "supercollider", "surface", "svelte", "sxhkdrc", "systemtap", "t32", "tablegen", "terraform", "thrift", "tiger", "tlaplus", "todotxt", "toml", "tsx", "turtle", "twig", "typescript", "ungrammar", "usd", "uxntal", "v", "vala", "verilog", "vhs", "vim", "vimdoc", "vue", "wgsl", "wgsl_bevy", "yaml", "yang", "yuck", "zig"
        -- , "comment"
      },
      highlight = { enable = true, },
    }
  end
}

