return {
    { --资源库，包含了大量语言的可补全信息
        "rafamadriz/friendly-snippets",
        lazy = true,
    },

    {     --小图标支持
        'onsails/lspkind-nvim',
        lazy = true,
    },

    { --snippet引擎，用于展示补全信息
        "L3MON4D3/LuaSnip",
        lazy = true,
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
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
                    { name = 'buffer' },
                    { name = 'path' },
                }),
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
}
