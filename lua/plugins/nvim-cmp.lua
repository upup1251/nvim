return {
    { --资源库，包含了大量语言的可补全信息
        "rafamadriz/friendly-snippets",
        lazy = true,
    },

    {     --小图标支持
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
            {'saadparwaiz1/cmp_luasnip'},

            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
        },
        config = function()
            local cmp = require 'cmp'
            cmp.setup({
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
                },{
                    { name = 'buffer' },
                    { name = 'path' },
                }),
                formatting = {
                   format = require('lspkind').cmp_format({
                     with_text = true, -- do not show text alongside icons
                     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                     before = function (entry, vim_item)
                       -- Source 显示提示来源
                       vim_item.menu = "["..string.upper(entry.source.name).."]"
                       return vim_item
                     end
                   })
                 },
                mapping = {
                    ['<TAB>'] = cmp.mapping.select_next_item(),
                    ['<S-TAB>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<ESC>'] = cmp.mapping {
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    },
                }
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
            config = function ()
                require('myluasnip')
               -- 加载 snippets
                require('luasnip.loaders.from_vscode').lazy_load()
            end
        }
}
