return {
    { --资源库，包含了大量语言的可补全信息
        "rafamadriz/friendly-snippets",
        lazy = true,
    },

    { --小图标支持
        'onsails/lspkind-nvim',
        lazy = true,
    },

    --nvim-cmp的本体
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        event = "InsertEnter",
        dependencies = {
            -- nvim-cmp的补全资源来源
            { "L3MON4D3/LuaSnip" },
            { 'onsails/lspkind-nvim' },
            { "rafamadriz/friendly-snippets" },
            --luasnip和cmp之间的桥梁，没有不行呜呜呜我现在知道了
            { 'saadparwaiz1/cmp_luasnip' },

            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-nvim-lua' },
        },

        config = function()
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

            -- insert `(` after select function or method item
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )

            cmp.setup({
                experimental = {
                    ghost_text = true,
                },
                snippet = {
                    --在这里选择snippet engine luasnip
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                -- 补全信息的来源，按顺序优先
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = "nvim_lua" },
                    { name = 'buffer' },
                    { name = 'path' },
                }),
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry,
                            vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. (strings[1] or "") .. " "
                        kind.menu = "    (" .. (strings[2] or "") .. ")"

                        return kind
                    end,
                    --将图标放在后面
                    -- format = require('lspkind').cmp_format({
                    --     with_text = true, -- do not show text alongside icons
                    --     maxwidth = 50,    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    --     before = function(entry, vim_item)
                    --
                    --         -- 使用 lspkind 获取图标
                    --         local kind_icon = vim_item.kind
                    --         -- 将图标放在最前面，文字（补全类型）放在最后面
                    --         vim_item.kind = kind_icon                                       -- 这个地方会是图标
                    --
                    --         return vim_item
                    --     end
                    -- })
                },
                window = {
                    completion = {
                        border = border "CmpBorder", -- 为补全窗口添加边框
                        scrollbar = false,           -- 不显示滚动条
                    },
                    documentation = {
                        border = border "CmpDocBorder",                                 -- 为文档窗口添加边框
                        winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None", -- 高亮当前选中项
                    },

                },
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback() -- 如果补全栏不可见，执行默认行为
                        end
                    end, { 'i', 's' }),

                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback() -- 如果补全栏不可见，执行默认行为
                        end
                    end, { 'i', 's' }),

                    ['<CR>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ select = true }) -- 补全栏打开时，选择补全项
                        else
                            fallback()                     -- 如果补全栏不可见，执行默认的回车行为
                        end
                    end, { 'i', 's' }),

                    ['<S-ESC>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.abort() -- 补全栏打开时，取消补全
                        else
                            fallback()  -- 如果补全栏不可见，执行默认的 Esc 行为
                        end
                    end, { 'i', 's' }),
                })
            })
        end
    },

    { --snippet引擎，用于展示补全信息
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        lazy = true,
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        config = function()
            require('myluasnip')
            -- 加载 snippets
            require('luasnip.loaders.from_vscode').lazy_load()
        end
    }
}
