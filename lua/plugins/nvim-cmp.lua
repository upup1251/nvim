return {

    --nvim-cmp的本体
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        event = "InsertEnter",
        dependencies = {
            -- -- adds vscode-like pictograms(图标) to neovim built-in lsp
            -- -- 不用了，自己上图标
            -- { 'onsails/lspkind-nvim' },

            -- nvim-cmp的补全资源来源
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
            --luasnip和cmp之间的桥梁，没有不行呜呜呜我现在知道了
            { 'saadparwaiz1/cmp_luasnip' },

            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-nvim-lua' },
            -- 数据库
            {
                "MattiasMTS/cmp-dbee",
                dependencies = {
                    { "kndndrj/nvim-dbee" }
                },
                ft = "sql", -- optional but good to have
                opts = {},  -- needed
            },

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

            local kind_icons = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
                -- 数据库
                table = "",
                keyword = "󰌋",
            }

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
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = "nvim_lua" },
                    { name = "cmp-dbee" },
                    { name = 'buffer' },
                },

                -- 自定义补全菜单中每一项的显示格式
                formatting = {

                    -- 排序
                    fields = { "kind", "abbr", "menu" },
                    -- vim_item中包含排序中的值
                    format = function(entry, vim_item)
                        -- Source
                        local menu = ({
                            nvim_lsp = "LSP",
                            luasnip = "SNIP",
                            nvim_lua = "NVIM",
                            ["cmp-dbee"] = "DBEE",
                            buffer = "BUF",
                            path = "PATH",
                        })[entry.source.name] or "?"
                        vim_item.menu = string.format('(%s.%s)', menu, vim_item.kind) -- This concatenates the icons with the name of the item kind
                        -- Kind icons
                        vim_item.kind = kind_icons[vim_item.kind] or '?'
                        return vim_item
                    end
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
        version = "v2.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        config = function()
            require('myluasnip')
            -- 加载 snippets
            require('luasnip.loaders.from_vscode').lazy_load()
        end
    },

    { --资源库，包含了大量语言的可补全信息
        "rafamadriz/friendly-snippets",
        lazy = true,
    },


    -- 现在是自己提供图标
    -- { --小图标支持
    --     'onsails/lspkind-nvim',
    --     lazy = true,
    -- },
    --
}
