-- leader setup
vim.g.mapleader = ' '
vim.g.maplqocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- lazy

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  { -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },

  { -- Move lines/selection
    'matze/vim-move',
    init = function()
      -- disable default key bindings
      vim.g.move_map_keys = 0
    end,
  },

  { -- lsp
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.gopls.setup{}
      lspconfig.clangd.setup{}
    end,
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      "neovim/nvim-lspconfig",
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'f3fora/cmp-spell',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
    },
  },

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- Highlight
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
  },

  { -- minimap (toggle <leader>vm, toggle focus <leader>vmf
    'gorbit99/codewindow.nvim',
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup({
        minimap_width = 10,
      })
      vim.keymap.set('n', '<leader>vm', codewindow.toggle_minimap, { desc = 'Toggle minimap', silent = true })
      vim.keymap.set('n', '<leader>vmf', codewindow.toggle_focus, { desc = 'Toggle minimap focus', silent = true })
    end,
  },

  -- theme
  { 'rktjmp/lush.nvim' }, --needed by kimbox
  { "savq/melange-nvim" }, -- brown/blue, fe, dark easy on the eyes ****
  { "xero/miasma.nvim", },      -- flat brown **
  { 'rebelot/kanagawa.nvim' }, -- good default , dark, fe
  {"EdenEast/nightfox.nvim"}, -- *****
  { 'alligator/accent.vim' }, -- ***** mono, single color, dark
  { 'huyvohcmc/atlas.vim' }, -- ***** mono, dark
  { "koron/vim-monochromenote" }, -- mono, light
  { "jaredgorski/fogbell.vim" }, -- mono, dark, mid, light *****
  {'Abstract-IDE/Abstract-cs'}, -- nice brown tones
  {"lmburns/kimbox"}, -- AMBER ***** needs lush ...

  { -- file explorer
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.keymap.set('n', '<Leader>e', ':Neotree toggle=true<CR>', { desc = "Toggle explorer", silent = true })
      vim.keymap.set('n', '<Leader>ef', ':Neotree action=focus<CR>', { desc = "Focus explorer", silent = true })

      require("neo-tree").setup({
        opts = {
          sources = { "filesystem", "buffers", "git_status", "document_symbols" },
        },
        window = {
          width = 35,
        },
      })
    end,
  },

  { -- notification box (require("notify")("Hello World"))
    'rcarriga/nvim-notify'
  },

  { -- terminal
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      direction = 'float',
      open_mapping = [[<Leader>t]],
      insert_mappings = false,
    },
  },

  { -- outline
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('aerial').setup()
      vim.keymap.set('n', '<leader>vo', '<cmd>AerialToggle!<CR>')
    end,
  },

  { -- TodoManager
  -- BOOKMARK asd
  -- TEST asd
  -- NOTE asd
  -- PERF asd
  -- WARN asd
  -- HACK asd
  -- TODO asd
  -- FIX asd
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "EORROR", "FAIL" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO", "NOTICE" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        BOOKMARK = {  icon = "", color = "info", alt = { "B", "BM" } },
      },
      search = {
        pattern = "^\\s*((--)|(//)|(/\\*)|(\\#|;|!))\\s+(KEYWORDS)[:]?\\b",
      },
      highlight = {
        multiline = false,
        -- https://rosettacode.org/wiki/Comments for more patterns
        pattern = {
          "^\\s*[-]{2}\\s(KEYWORDS):?\\s",
          "^\\s*[-]{2}\\s(KEYWORDS):?$",
          "^\\s*[/]{2}\\s(KEYWORDS):?\\s",
          "^\\s*[/]{2}\\s(KEYWORDS):?$",
          "^\\s*[/][*]\\s(KEYWORDS):?\\s",
          "^\\s*[/][*]\\s(KEYWORDS):?$",
          "^\\s*[#]\\s(KEYWORDS):?\\s",
          "^\\s*[#]\\s(KEYWORDS):?$",
          "^\\s*[;]\\s(KEYWORDS):?\\s",
          "^\\s*[;]\\s(KEYWORDS):?$",
          "^\\s*[!]\\s(KEYWORDS):?\\s",
          "col\\s[0-9]+\\|\\s(KEYWORDS)(:?\\s)?", -- match for the TodoLocList
        },
        comments_only = false,
        before = "fg",
        keyword = "bg",
        after = "fg",
      },
      colors = {
        error = { "#DC2626" },
        warning = { "#FBBF24" },
        info = { "#2563EB" },
        hint= { "#10B981" },
        default = { "#7C3AED" },
        test = { "#FF00FF" }
      },
    },
  },

  { -- indentation rails
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").update {
        enabled = false,
        indent = {
          --char = "│",
          char = "▎",
        },
        whitespace = {
          remove_blankline_trail = false,
        },
        scope = {
          show_start = false,
          show_end = false,
        },
      }
      vim.keymap.set({'n'}, '<Leader>vi', function() vim.fn.execute("IBLToggle") end, { silent = true, desc = "Toggle indentation rails" })
    end,
  },

  { -- tab bar
    "romgrk/barbar.nvim",
    opts = {
     sidebar_filetypes = {
       ['neo-tree'] = {event = 'BufWipeout', text = 'Neo-Tree', align = 'center'},
     },
    },
  },

  { -- status
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    opts = function(_, opts)
      return { theme = 'gruvbox' }
    end,
  },

  { -- telescope
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_strategy = 'vertical',
          layout_config = {
            vertical = { width = 0.75 }
          },
        },
      })
    end,
  },

}, {})
-- More
-- Bookmarks https://github.com/tomasky/bookmarks.nvim
-- navigation https://github.com/ggandor/lightspeed.nvim
-- buffer window https://github.com/j-morano/buffer_manager.nvim
-- Command line https://github.com/folke/noice.nvim
-- Screenshot https://github.com/niuiic/code-shot.nvim
-- Bread crumbs https://github.com/utilyre/barbecue.nvim
-- Code runner https://github.com/desdic/greyjoy.nvim
-- Renaming https://github.com/filipdutescu/renamer.nvim
-- Folding https://github.com/anuvyklack/pretty-fold.nvim

-- Bind Todo Manager
vim.keymap.set({'n'}, '<Leader>pt', ':TodoLocList<CR>')
vim.keymap.set({'n'}, '<Leader>vt', function() vim.fn.execute(":TodoLocList cwd=" .. vim.fn.expand('%:p')) end)

-- Bind vim-move
vim.keymap.set({'v'}, '<A-Up>', '<Plug>MoveBlockUp')
vim.keymap.set({'v'}, '<A-Down>', '<Plug>MoveBlockDown')
vim.keymap.set({'v'}, '<A-Left>', '<Plug>MoveBlockLeft')
vim.keymap.set({'v'}, '<A-Right>', '<Plug>MoveBlockRight')

vim.keymap.set({'i'}, '<A-Up>', function() vim.cmd [[execute "normal \<Plug>MoveLineUp"]] end, { desc = "Move line up", silent = true })
vim.keymap.set({'i'}, '<A-Down>', function() vim.cmd [[execute "normal \<Plug>MoveLineDown"]] end, { desc = "Move line down", silent = true })

-- Bind telescope

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fk', telescope_builtin.keymaps, {})
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fr', telescope_builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fi', telescope_builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>fd', telescope_builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>ft', telescope_builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>fs', telescope_builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fl', function()telescope_builtin.diagnostics({bufnr=0})end, {})

-- Set Theme
vim.o.background = "dark"
vim.cmd("colorscheme kanagawa") -- needed for initial reset
vim.cmd("colorscheme terafox")


local csDark = {
  "kanagawa",
  "nightfox",
  "duskfox",
  "nordfox",
  "terafox",
  "carbonfox",
  "accent",
  "atlas",
  "fogbell",
  "abscs",
  "melange",
  "miasma",
}

local csLight = {
  "dayfox",
  "dawnfox",
  "monochromenote",
  "fogbell_light",
}

local csDarkIndex = 0
local csLightIndex = 0
local csCurrentDark = true

vim.keymap.set({'n'}, '<Leader>ü', function()
  if csCurrentDark then
    csDarkIndex = (csDarkIndex + 1) % table.getn(csDark)
  else
    csCurrentDark = true
  end
  --vim.o.background = "dark"
  local s = csDark[csDarkIndex + 1]
  vim.cmd("colorscheme " .. s)
  require("notify")("Color: " .. s)
end, { silent = true, desc = "Switch to dark color scheme" })

vim.keymap.set({'n'}, '<Leader>ä', function()
  if csCurrentDark then
    csCurrentDark = false
  else
    csLightIndex = (csLightIndex + 1) % table.getn(csLight)
  end
  local s = csLight[csLightIndex + 1]
  --vim.o.background = "light"
  vim.cmd("colorscheme " .. s)
  require("notify")("Color: " .. s)
end, { silent = true, desc = "Switch to light color scheme" })


-- hide current mode
--vim.o.showmode = false
--vim.o.ruler = false
--vim.o.showcmd = false
vim.o.cmdheight = 0
vim.opt.laststatus = 0

vim.keymap.set({'n'}, '<Leader>vl', function()
  if vim.o.laststatus == 0 then
    vim.opt.laststatus = 2
  else
    vim.opt.laststatus = 0
  end
end, { silent = true, desc = "Toggle status line" })

-- disable save by move (point filename to new inode), enable save in-place
vim.o.backupcopy = "yes"

-- highlight current line
vim.o.cursorline = true

-- blinking cursor
-- https://stackoverflow.com/a/63924002
-- vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"

-- Set highlight on search
vim.o.hlsearch = false

-- Enable line numbers
vim.wo.number = true
vim.o.relativenumber = true

vim.keymap.set({'n'}, '<Leader>vn', function()
  vim.wo.number        = not vim.wo.number
  vim.o.relativenumber = not vim.o.relativenumber
end, { silent = true, desc = "Toggle line numbers" })

-- Enable mouse mode
vim.o.mouse = 'nv'

vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Tab settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Scroll settings
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.keymap.set({'i', 'n', 'v'}, '<PageDown>', function() vim.fn.execute("normal ".. math.floor(vim.fn.winheight(".") / 3) .. "j") end, { silent = true })
vim.keymap.set({'i', 'n', 'v'}, '<PageUp>', function() vim.fn.execute("normal ".. math.floor(vim.fn.winheight(".") / 3) .. "k") end, { silent = true })

-- spell checking
vim.o.spell = false
vim.o.spelllang = "en_us"

vim.keymap.set({'n'}, '<Leader>vw', function()
  vim.o.spell = not vim.o.spell
end, { silent = true, desc = "Toggle spell checking" })

-- Set <Leader> timings
vim.o.updatetime = 250
vim.o.timeoutlen = 400

-- show whitespace
vim.o.list = false
vim.opt.listchars:append "tab:-->"
vim.opt.listchars:append "trail:·"
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

vim.keymap.set({'n'}, '<Leader>vs', function()
  vim.o.list = not vim.o.list
end, { silent = true, desc = "Toggle whitespace" })

-- highlight trailing whitespace
vim.cmd('match ExtraWhitespace /\\s\\+$/')
vim.cmd('highlight ExtraWhitespace ctermbg=DarkRed guibg=DarkRed guifg=LightRed')

-- Cursor Movement

-- allow left, right, h, l to move between lines if at ^ or $
vim.opt.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true,
  h = true,
  l = true,
}

-- if cursor is at ^ keep it at ^ instead of putting it at $
vim.keymap.set({'n'}, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({'n'}, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({'n'}, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({'n'}, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('i', '<Down>', '<cmd>norm! gj<cr>', { silent = true })
vim.keymap.set('i', '<Up>', '<cmd>norm! gk<cr>', { silent = true })

-- [[ Configure nvim-cmp ]]
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

local cmp_menu_mapping = {
  treesitter = "[TS]",
  luasnip = "[SN]",
  buffer = "[BF]",
  path = "[FS]",
  spell = "[SP]",
  calc = "[CC]",
  nvim_lsp = "[LS]",

}

local cmp_kind_mapping = {
  -- path
  File = "Fil",
  Folder = "Dir",
  Snippet = "Snp",
  -- treesitter
  Variable = "Var",
  VariableMember = "Var",
  Text = "Txt",
  FunctionMethod = "Met",
  Function = "Fnc",
  Constant = "Cns",
  Text = "Txt",
  Type = "Typ",
  Property = "Pro",
  Module = "Mod",
  Class = "Cls",
  Struct = "Sct",
  Interface = "Ifc",
  Field = "Fld",
  Keyword = "Kwr",
  Method = "Mth",
}

cmp.setup {
  completion = {
    autocomplete = false
  },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = function (entry, vim_item)
      vim_item.menu = entry.source.name
      if cmp_kind_mapping[vim_item.kind] ~= nil then
        vim_item.kind = cmp_kind_mapping[vim_item.kind]
      end
      if cmp_menu_mapping[vim_item.menu] ~= nil then
        vim_item.menu = cmp_menu_mapping[vim_item.menu]
      end
      return vim_item
    end
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping({
        i = function()
          if cmp.visible() then
            cmp.abort()
          else
            cmp.complete()
          end
        end,
        c = function()
          if cmp.visible() then
            cmp.close()
          else
            cmp.complete()
          end
        end,
      }),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'calc' },
    { name = 'path' },
    { name = 'nvim_lsp' },
    -- spell loads f3fora/cmp-spell uses vims spellsuggest to source words
    { name = 'spell',
      option = {
        keep_all_entries = true,
        enable_in_context = function() return true end,
      },
      entry_filter = function(entry, ctx)
        -- only show words without spaces
        return string.find(entry:get_word(), " ") == nil
      end,
      max_item_count = 5,
    },
    { name = 'treesitter',
      entry_filter = function(entry, ctx)
        -- filter simple text tokens
        local kind = entry:get_vim_item(0).kind
        return kind ~= 'Text' and
          kind ~= 'Number' and
          kind ~= 'Boolean' and
          kind ~= 'String' and
          kind ~= 'Operator' and
          kind ~= 'Comment' and
          kind ~= 'Constructor' and
          kind ~= 'StringEscape' and
          kind ~= 'StringRegexp' and
          kind ~= 'NonePunctuationSpecial' and
          kind ~= 'ConstantBuiltin' and
          not string.match(kind, "Keyword.*")
      end
    },
    -- ?? buffer loads hrsh7th/cmp-buffer which sources words from open buffers
    { name = 'buffer',
      max_item_count = 5,
    },
    -- luasnip loads saadparwaiz1/cmp_luasnip which depends on L3MON4D3/LuaSnip which loads templates from rafamadriz/friendly-snippets
    { name = 'luasnip', option = { use_show_condition = false },
      max_item_count = 5,
    },
  },
}

-- LSP keybindings

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
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
  end,
})

-- Personal Keymappings
vim.keymap.set('i', '<C-Del>', function ()
  local pos = vim.fn.col(".")
  local epos = vim.fn.col("$")
  local line = vim.fn.getline(".")
  local nextChar = vim.fn.strpart(line, vim.fn.col(".")-1, 1, 1)
  local deleteMatch = function(str, pos, regex)
    local rest = string.sub(str, pos)
    local match = string.match(rest, regex)
    local newStr = string.sub(str, 0, pos-1) .. string.sub(rest, string.len(match)+1)
    return newStr
  end

  if epos == 1 or pos == epos then
     vim.fn.execute('normal gJ')
     vim.fn.cursor(vim.fn.line("."), pos)
  elseif string.match(nextChar, '[%a%d]') then
    vim.fn.setline(".", deleteMatch(line, pos, '[%a%d]*'))
  elseif string.match(nextChar, '[%s]') then
    vim.fn.setline(".", deleteMatch(line, pos, '[%s]*'))
  elseif string.match(nextChar, '[%p]') then
    vim.fn.setline(".", deleteMatch(line, pos, '[%p]*'))
  else
    vim.fn.setline(".", string.sub(line, 0, pos-1) .. string.sub(line, pos+1))
  end
end , { desc = "Delete word forward", silent = true })

vim.keymap.set('i', '<C-h>', function ()
  local pos = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local prevChar = vim.fn.strpart(line, vim.fn.col(".")-2, 1, 1)
  local deleteMatch = function(str, pos, regex)
    local start = string.sub(str, 0, pos-1)
    local match = string.match(start, regex)
    return string.sub(start, 0, pos-string.len(match)-1) .. string.sub(str, pos)
  end

  if pos == 1 or pos == 0 then
    vim.fn.execute('normal h$Jx')
    vim.fn.cursor(vim.fn.line("."), pos)
  elseif string.match(prevChar, '[%a%d]') then
    vim.fn.setline(".", deleteMatch(line, pos, '[%a%d]*$'))
  elseif string.match(prevChar, '[%s]') then
    vim.fn.setline(".", deleteMatch(line, pos, '[%s]*$'))
  elseif string.match(prevChar, '[%p]') then
    vim.fn.setline(".", deleteMatch(line, pos, '[%p]*$'))
  else
    require("notify")("what just happened?")
    -- delete from the end of this line ü
    -- delete from the end of this line ↰
    return nil
  end

  vim.fn.cursor(vim.fn.line("."), pos-(string.len(line) - string.len(vim.fn.getline("."))))

end , { desc = "Delete word backwords", silent = true })

vim.keymap.set('v', 'a', 'I', { desc = "Enter insert mode in visual mode", silent = true })

vim.keymap.set({'n', 'i'}, '<M-y>', function()
  local pos = vim.fn.col(".")
  vim.fn.execute("normal 0y$")
  vim.fn.cursor(vim.fn.line("."), pos)
end, { desc = "Yank whole line", silent = true })

vim.keymap.set({'n', 'i'}, '<M-p>', function ()
  local pos = vim.fn.col(".")
  local epos = vim.fn.col("$")

  if epos == 1 then
    -- require('notify')("line is empty")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col("$"))
  elseif pos == epos then
    -- require('notify')("at end")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col("$"))
  elseif pos == 1 then
    -- require('notify')("at start")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col(".")+1)
  else
    -- require('notify')("in middle")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col(".")+1)
  end
end , { desc = "Paste default buffer", silent = true })

vim.keymap.set('n', 'p', function ()
  local pos = vim.fn.col(".")
  local epos = vim.fn.col("$")

  if epos == 1 then
    -- require('notify')("line is empty")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col("$"))
  elseif pos == epos then
    -- require('notify')("at end")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col("$"))
  elseif pos == 1 then
    -- require('notify')("at start")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col(".")+1)
  else
    -- require('notify')("in middle")
    vim.fn.execute("normal P")
    vim.fn.cursor(vim.fn.line("."), vim.fn.col(".")+1)
  end
end , { desc = "Paste default buffer", silent = true })

-- Save file
vim.keymap.set({'i'}, '<M-w>', '<esc>:w!<CR>a', { desc = "Save file", silent = true })
vim.keymap.set({'n'}, '<M-w>', '<esc>:w!<CR>', { desc = "Save file", silent = true })

-- Split buffer
vim.keymap.set({'n'}, '<Leader>-', ':sp<CR>', { desc = "Split window horizontally", silent = true })
vim.keymap.set({'n'}, '<Leader>7', ':vsp<CR>', { desc = "Split window vertically", silent = true })

-- Buffers
vim.keymap.set({'n', 'i'}, '<M-PageUp>', ':bprevious<CR>', { desc = "Show previous buffer", silent = true })
vim.keymap.set({'n', 'i'}, '<M-PageDown>', ':bnext<CR>', { desc = "Show next buffer", silent = true })
vim.keymap.set({'n', 'i'}, '<M-q>', '<esc>:BufferClose<CR>', { desc = "Close barbar tab", silent = true })

vim.keymap.set({'n', 'i'}, '<M-S-q>', '<esc>:q<CR>', { desc = "Close barbar tab", silent = true })

vim.keymap.set({'n'}, '<Leader><PageUp>', ':bprevious<CR>', { desc = "Show previous buffer", silent = true })
vim.keymap.set({'n'}, '<Leader><PageDown>', ':bnext<CR>', { desc = "Show next buffer", silent = true })


vim.keymap.set({'n'}, '<Leader><Left>', '<C-w><Left>', { desc = "Focus left window", silent = true })
vim.keymap.set({'n'}, '<Leader><Up>', '<C-w><Up>', { desc = "Focus top window", silent = true })
vim.keymap.set({'n'}, '<Leader><Right>', '<C-w><Right>', { desc = "Focus right window", silent = true })
vim.keymap.set({'n'}, '<Leader><Down>', '<C-w><Down>', { desc = "Focus down window", silent = true })

vim.keymap.set({'n'}, '<S-Tab>', '<<', { desc = "Unindent with shift tab", silent = true })
vim.keymap.set({'i'}, '<S-Tab>', function()
  local pos = vim.fn.col(".")
  local lineLength = string.len(vim.fn.getline("."))
  vim.fn.execute("normal <<")
  vim.fn.cursor(vim.fn.line("."), pos - (lineLength - string.len(vim.fn.getline("."))))
end, { desc = "Unindent with shift tab", silent = true })

function goBeginWord (offsetInsertMode)
  local pos = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local char = vim.fn.strpart(line, pos - 1, 1, 1)
  if string.match(char, '[%a%d]') then
    while string.match(char, '[%a%d]') do
      pos = pos - 1
      char = vim.fn.strpart(line, pos - 1, 1, 1)
    end
    if offsetInsertMode then
      vim.fn.cursor(vim.fn.line("."), pos + 2)
    else
      vim.fn.cursor(vim.fn.line("."), pos + 1)
    end
  end
end

function goEndWord ()
  local pos = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local char = vim.fn.strpart(line, pos - 1, 1, 1)
  if string.match(char, '[%a%d]') then
    while string.match(char, '[%a%d]') do
      pos = pos + 1
      char = vim.fn.strpart(line, pos - 1, 1, 1)
    end
    if vim.fn.mode() == 'i' then
      vim.fn.cursor(vim.fn.line("."), pos)
    else
      vim.fn.cursor(vim.fn.line("."), pos - 1)
    end
  end
end

vim.keymap.set({'n', 'i', 'v'}, '<M-b>', function()goBeginWord(false)end, { desc = "Jump to begin of current word", silent = true })
vim.keymap.set({'n', 'i', 'v'}, '<M-e>', goEndWord, { desc = "Jump to end of current word", silent = true })

vim.keymap.set({'i'}, '<M-r>', function ()
  goBeginWord(true)
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<esc>ve"hy<esc>:%s/<C-r>h/<C-r>h/g<left><left>', true, false, true)) -- escape, enter v mode, select to end of word, activate register h, yank, escape, substitute
end, { desc = "Replace current word", silent = true })

vim.keymap.set({'n'}, '<M-r>', function ()
  goBeginWord(false)
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes('ve"hy<esc>:%s/<C-r>h/<C-r>h/g<left><left>', true, false, true)) -- escape, enter v mode, select to end of word, activate register h, yank, escape, substitute
end, { desc = "Replace current word", silent = true })

vim.keymap.set({'v'}, '<M-r>', function() vim.fn.feedkeys(vim.api.nvim_replace_termcodes('"hy:%s/<C-r>h/<C-r>h/g<left><left>', true, false, true)) end, { desc = "Replace selection", silent = true })

vim.keymap.set({'n', 'v'}, '<Home>', function()
  local pos = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local left = vim.fn.strpart(line, 0, pos-1, 1)
  if string.match(left, '^[%s]*$') then
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('0', true, false, true))
  else
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('^', true, false, true))
  end
end, { desc = "Pos1 with detour", silent = true })

vim.keymap.set({'i'}, '<Home>', function()
  local pos = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local left = vim.fn.strpart(line, 0, pos-1, 1)
  if string.match(left, '^[%s]*$') then
    vim.fn.cursor(vim.fn.line("."), 1)
  else
    local s, e = string.find(left, '^[%s]*')
    vim.fn.cursor(vim.fn.line("."), e + 1)
  end

end, { desc = "Pos1 with detour", silent = true })


