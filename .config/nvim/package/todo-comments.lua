#!/bin/env lua

-- TodoManager
-- BOOKMARK asd    
-- TEST asd
-- NOTE asd
-- PERF asd
-- WARN asd
-- HACK asd
-- TODO asd
-- FIX asd
return {
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
}

