#!/bin/env lua

local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

-- [[ Configure nvim-cmp ]]
local cmp = require ('cmp')
local compare = require('cmp.config.compare')

local cmp_menu_mapping = {
  treesitter = "[TS]",
  luasnip = "[SN]",
  ["buffer-lines"] = "[LN]",
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
  VariableBuiltin = "Var",
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
  Spell = "Spl",
}

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

cmp.setup {
  experimental = {
    ghost_text = { hl_group = 'Comment' },
  },
  window = {
    completion = {
      side_padding = 1,
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:PmenuSel",
      scrollbar = false,
      border = border "CmpDocBorder",
    },
    documentation = {
      border = border "CmpDocBorder",
      winhighlight = "Normal:CmpDoc",
    },
  },
  completion = {
    autocomplete = false,
    completeopt = "menu,menuone",
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
    ['<C-down>'] = cmp.mapping.scroll_docs(-4),
    ['<C-up>'] = cmp.mapping.scroll_docs(4),
    ['<PageDown>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior, count = 4}),
    ['<PageUp>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior, count = 4}),
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
    ['<Right>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
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
    { name = 'calc', priority = 100 },
    { name = 'path', priority = 99 },
    { name = 'nvim_lsp', priority = 98 },
    { name = 'buffer-lines',
      option = {
        comments = true,
        leading_whitespace = false,
       },
       max_item_count = 1,
       priority = 97,
    },
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
      priority = 96,
    },
    -- luasnip loads saadparwaiz1/cmp_luasnip which depends on L3MON4D3/LuaSnip which loads templates from rafamadriz/friendly-snippets
    { name = 'luasnip', option = { use_show_condition = false },
      max_item_count = 5,
      priority = 98,
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
          kind ~= 'MarkupList' and
          kind ~= 'MarkupRawBlock' and
          kind ~= 'MarkupHeading1' and
          kind ~= 'MarkupHeading2' and
          kind ~= 'MarkupHeading3' and
          kind ~= 'MarkupHeading4' and
          kind ~= 'MarkupHeading5' and
          kind ~= 'MarkupHeading6' and
          not string.match(kind, "Keyword.*")
      end,
      priority = 90,
    },
    -- ?? buffer loads hrsh7th/cmp-buffer which sources words from open buffers
    { name = 'buffer',
      max_item_count = 5,
      priority = 50,
    },
  },
}

