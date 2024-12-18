-- myluasnip.lua
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


-- NOTE: 键位绑定

-- 检查是否仍然和snip绑定
-- 检查并展开代码片段，如果没有可展开的，则恢复默认行为
-- vim.keymap.set({ "i" }, "<Enter>", function()
--     if ls.expand_or_jumpable() then
--         ls.expand()
--     else
--         vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Enter>", true, false, true), "n", true)
--     end
-- end, { silent = true })
--
--跳转到下一个占位符（仅在代码片段内生效）
vim.keymap.set({ "i", "s" }, "<Tab>", function(fallback)
    if ls.jumpable(1) then
        ls.jump(1)
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<tab>", true, false, true), "n", true)
    end
end, { silent = true })

-- 跳转到上一个占位符（仅在代码片段内生效）
vim.keymap.set({ "i", "s" }, "<S-Tab>", function(fallback)
    if ls.jumpable(-1) then
        ls.jump(-1)
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-tab>", true, false, true), "n", true)
    end
end, { silent = true })
--
-- -- 在可选择的代码片段选项中切换
-- vim.keymap.set({ "i", "s" }, "<C-E>", function()
--     if ls.choice_active() then
--         ls.change_choice(1)
--     end
-- end, { silent = true })
--


-- offical: work terriable , it will own <tab> for every
-- vim.keymap.set({"i"}, "<enter>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<tab>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<S-tab>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

-- NOTE: 补全片段中所需的函数

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

    local table = { header, separator }
    for _ = 1, rows do
        table[#table + 1] = row
    end

    return table
end


-- 根据当前文件类型返回相应的注释前缀和后缀
local function get_comment_prefix()
    local filetype = vim.bo.filetype
    if filetype == "lua" or filetype == "vim" or filetype == "conf" then
        return "-- ", ""
    elseif filetype == "python" or filetype == "sh" then
        return "# ", ""
    elseif filetype == "c" or filetype == "cpp" or filetype == "java" or filetype == "javascript" or filetype == "typescript" then
        return "// ", ""
    elseif filetype == "html" or filetype == "xml" or filetype == "markdown" then
        return "<!-- ", " -->"
    elseif filetype == "css" then
        return "/* ", " */"
    else
        return "", ""
    end
end

-- NOTE: 定义补全触发器

-- 定义 Markdown 代码片段
ls.add_snippets("markdown", {
    s("english", {
        t("### "),
        i(1),
        t({ "", "", "***Sentence***", "", "" }),
        i(2),
        t({ "", "", "***Analysis***", "", "" }),
        i(3),
        t({ "", "", "***Translation***", "", "" }),
        i(4)
    }),
    -- 表格
    s("table", {
        t("行数: "), i(1, "2"), t({ "", "列数: " }), i(2, "3"), t({ "", "" }),
        f(function(args)
            return generate_table(args)
        end, { 1, 2 })
    }),
    s("math", {
        t("$"), i(1, "context"), t("$")
    }),
    s("mathLine", {
        t("$$"), i(1, "context"), t("$$")
    }),

})

-- 为所有文件提供补全代码片段
ls.add_snippets( "all", {
    -- for todo
    -- dependence: comments
    s("todo", {
        t(" TODO: "),
        i(1, "todo"),
        f(function ()
            vim.cmd("normal! gcc")
        end),
        i(0)
    }),
    s("fixme", {
        t(" FIXME: "),
        i(1, "fixme"),
        f(function ()
            vim.cmd("normal gcc")
        end),
        i(0)
    }),

    s("note", {
        t(" NOTE: "),
        i(1, "note"),
        f(function ()
            vim.cmd("normal gcc")
        end),
        i(0)
    }),
})
