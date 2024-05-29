-- 加载代码片段
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local fmt = extras.fmt
local m = extras.m
local l = extras.l
local postfix = require "luasnip.extras.postfix".postfix

vim.keymap.set({ "i" }, "<C-i>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<S-j>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<S-k>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

ls.add_snippets("all", {

})



-- 定义生成表格函数
local function generate_table(args)
  local rows = tonumber(args[1][1])
  local cols = tonumber(args[2][1])

  local header = "|"
  local separator = "|"
  local row = "|"

  for _ = 1, cols do
    header = header .. "  |"
    separator = separator .. " --- |"
    row = row .. "  |"
  end

  local table = {header, separator}
  for _ = 1, rows do
    table[#table + 1] = row
  end

  return table
end

-- 定义 Markdown 代码片段
ls.add_snippets("markdown", {
  -- 标题 1
  s("h1", {
    t("# "), i(1, "header")
  }),
  -- 标题 2
  s("h2", {
    t("## "), i(1, "header")
  }),
  -- 标题 3
  s("h3", {
    t("### "), i(1, "header")
  }),
  -- 链接
  s("link", {
    t("["), i(1, "link text"), t("]("), i(2, "link"), t(")")
  }),
  -- 代码块
  s("code", {
    t("```"), i(1, "language"), t({"", ""}), i(2, "code"), t({"", "```"})
  }),
  -- 无序列表
  s("ul", {
    t("- "), i(1, "列表项")
  }),
  -- 有序列表
  s("ol", {
    t("1. "), i(1, "列表项")
  }),
  -- 图片
  s("img", {
    t("!["),i(1,"Alt text"),t("]("), i(2, "图片地址"), t(")")
  }),
  -- 引用
  s("quote", {
    t("> "), i(1, "引用内容")
  }),
  -- 粗体
  s("bold", {
    t("**"), i(1, "粗体文本"), t("**")
  }),
  -- 斜体
  s("italic", {
    t("*"), i(1, "斜体文本"), t("*")
  }),
  -- 删除线
  s("strikethrough", {
    t("~~"), i(1, "删除线文本"), t("~~")
  }),
  -- 表格
  s("table", {
    t("行数: "), i(1, "2"), t({"", "列数: "}), i(2, "3"), t({"", ""}),
    f(function(args)
      return generate_table(args)
    end, {1, 2})
  }),
  s("math", {
    t("$"), i(1, "context"), t("$")
  }),
  s("mathLine", {
    t("$$"), i(1, "context"), t("$$")
  })
})
