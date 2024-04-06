return {
    { --this is a ui
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    { --这是一个语法高亮插件
        'nvim-treesitter/nvim-treesitter',
        -- we should add the paser per language
        -- to do it , we can use :TSInstall language_name
        -- to know what language paser we have,we can use :TSInstallInfo
        lazy = true,
        require("lazy").setup({
            ensure_installed = all,
            highlight = {
                enable = true,
            },
            indent = { enable = true },
        })
    },

    { --符号自动成双对
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    { --彩虹括号
        'HiPhish/rainbow-delimiters.nvim',
        lazy = true,
        event = "LspAttach"
    },

    { --垂直线插件
        "lukas-reineke/indent-blankline.nvim",
        event = "LspAttach",
        dependencies = {
            "echasnovski/mini.indentscope",
        },
        opts = {},
        config = function()
            require("ibl").setup()
        end
    },

    {                    -- the scope of the place whre you are
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        lazy = true,
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },

    { --主题
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd [[colorscheme tokyonight]]
        end
    },

    { --上方的buffer栏
        'akinsho/bufferline.nvim',
        version = "*",
        --图标
        dependencies = 'nvim-tree/nvim-web-devicons',
        keys = {
            { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
            { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        },
        config = function()
            require("bufferline").setup {
                options = {
                    offsets = {
                        { --设置nvim-tree打开时buffer偏移
                            filetype = "NvimTree",
                            text = "File Explorer",
                            text_align = "left",
                            separator = true,
                        },
                    },
                    --这里是样式设计
                    --我们可以通过“:h bufferline-configuration”来查看具体设置
                    separator_style = "slanted"
                },
                vim.api.nvim_create_autocmd("BufAdd", {
                    callback = function()
                        vim.schedule(function()
                            pcall(nvim_bufferline)
                        end)
                    end,
                })
            }
        end
    },




    { --下方的状态栏
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup()
        end
    },

}
