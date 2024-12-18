-- color.lua
return {
    -- NOTE: 交互ui
    -- ------------

    { --this is a ui,
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
        },
    },

    -- NOTE: 括号
    -- ---------

    { --符号自动成双对
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    { --彩虹括号
        -- no many setting
        'HiPhish/rainbow-delimiters.nvim',
    },

    -- NOTE: 垂直线
    -- ------------

    { -- the scope of the place whre you are
        -- with the animation ,is vivid
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = "VeryLazy",

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
            require('mini.indentscope').setup({
                -- default mappings
                mappings = {
                    -- Textobjects
                    object_scope = 'ii',
                    object_scope_with_border = 'ai',

                    -- Motions (jump to respective border line; if not present - body line)
                    goto_top = '[i',
                    goto_bottom = ']i',
                },
            })
        end,
    },

    -- NOTE: Buffers选项卡
    -- ------------------

    { --上方的buffer栏
        'akinsho/bufferline.nvim',
        version = "*",
        --图标
        dependencies = 'nvim-tree/nvim-web-devicons',
        keys = {
            { "<A-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
            { "<A-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        },
        config = function()
            require("bufferline").setup {
                options = {
                    offsets = {
                        { --设置nvim-tree打开时buffer偏移
                            filetype = "NvimTree", "dbee-drawer",
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

    -- NOTE: Statusline状态栏

    { --下方的状态栏
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = "VeryLazy",
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    -- many preset themes can found on lualine github
                    -- theme = 'auto',
                    theme = {
                        normal = {
                            -- nil 透明背景色
                            a = { bg = nil, fg = nil, gui = 'bold' },
                            b = { bg = nil, fg = nil },
                            c = { bg = nil, fg = nil },
                        },
                        inactive = {
                            a = { bg = nil, fg = nil },
                            b = { bg = nil, fg = nil },
                            c = { bg = nil, fg = nil }
                        },
                    },
                    component_separators = '',
                    section_separators = '',
                    globalstatus = true,
                    disabled_filetypes = {
                        -- statusline = { 'dashboard', 'NvimTree' },
                        statusline = { 'dashboard' },
                    },

                },
                sections = {
                    -- lualine_a = { { 'filetype', colored = false, icon_only = true },
                    --     { 'filename' } },
                    lualine_a = { '' },
                    lualine_b = {
                        {
                            'diagnostics',
                            diagnostics_color = {
                                -- error = { fg = '#ffffff' },
                                -- warn = { fg = '#ffffff' },
                                -- info = { fg = '#ffffff' },
                            },
                        }
                    },
                    lualine_c = { '' },
                    -- lualine_x = {
                    --     {
                    --         'diff',
                    --         colored = false,
                    --         diff_color = {
                    --             -- Same color values as the general color option can be used here.
                    --             -- added    = { fg = '#ffffff' }, -- Changes the diff's added color
                    --             -- modified = { fg = '#ffffff' }, -- Changes the diff's modified color
                    --             -- removed  = { fg = '#ffffff' }, -- Changes the diff's removed color you
                    --         },
                    --     },
                    --     'branch'
                    -- },
                    lualine_x = { '' },
                    -- lualine_y = { 'progress' },
                    lualine_y = { '' },
                    -- lualine_z = { 'location' }
                    lualine_z = {
                        -- 输入的命令，通过noice
                        {require("noice").api.status.command.get,
                        cond = require("noice").api.status.command.has,
                        color = { fg = "#ff9e64" },
                        }
                    }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    },

    -- NOTE: 主界面
    -- -----------

    { --启动界面
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            --go home
            vim.api.nvim_set_keymap('n', '<leader>gh', ':Dashboard<CR>', { noremap = true, silent = true })
            require('dashboard').setup {
                -- change_to_vcs_root = true, --自动跳转到目标文件的.git文件根目录
                -- 我的评价是不如bufferenter自动切换目录的自动命令
                theme = "hyper", --doom/hyper，两种布局
                hide = {
                    statusline = true,
                },
                config = {
                    header = {
                        '                                ',
                        '                                ',
                        ' ⡿⠉⠄⠄⠄⠄⠈⠙⠿⠟⠛⠉⠉⠉⠄⠄⠄⠈⠉⠉⠉⠛⠛⠻⢿⣿⣿⣿⣿⣿ ',
                        ' ⠁⠄⠄⠄⢀⡴⣋⣵⣮⠇⡀⠄⠄⠄⠄⠄⠄⢀⠄⠄⠄⡀⠄⠄⠄⠈⠛⠿⠋⠉ ',
                        ' ⠄⠄⠄⢠⣯⣾⣿⡿⣳⡟⣰⣿⣠⣂⡀⢀⠄⢸⡄⠄⢀⣈⢆⣱⣤⡀⢄⠄⠄⠄ ',
                        ' ⠄⠄⠄⣼⣿⣿⡟⣹⡿⣸⣿⢳⣿⣿⣿⣿⣴⣾⢻⣆⣿⣿⣯⢿⣿⣿⣷⣧⣀⣤ ',
                        ' ⠄⠄⣼⡟⣿⠏⢀⣿⣇⣿⣏⣿⣿⣿⣿⣿⣿⣿⢸⡇⣿⣿⣿⣟⣿⣿⣿⣿⣏⠋ ',
                        ' ⡆⣸⡟⣼⣯⠏⣾⣿⢸⣿⢸⣿⣿⣿⣿⣿⣿⡟⠸⠁⢹⡿⣿⣿⢻⣿⣿⣿⣿⠄ ',
                        ' ⡇⡟⣸⢟⣫⡅⣶⢆⡶⡆⣿⣿⣿⣿⣿⢿⣛⠃⠰⠆⠈⠁⠈⠙⠈⠻⣿⢹⡏⠄ ',
                        ' ⣧⣱⡷⣱⠿⠟⠛⠼⣇⠇⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⡆⠄⠄⠄⠄⠄⠉⠈⠄⠄ ',
                        ' ⡏⡟⢑⠃⡠⠂⠄⠄⠈⣾⢻⣿⣿⡿⡹⡳⠋⠉⠁⠉⠙⠄⢀⠄⠄⠄⠄⠄⠂⠄ ',
                        ' ⡇⠁⢈⢰⡇⠄⠄⡙⠂⣿⣿⣿⣿⣱⣿⡗⠄⠄⠄⢀⡀⠄⠈⢰⠄⠄⠄⠐⠄⠄ ',
                        ' ⠄⠄⠘⣿⣧⠴⣄⣡⢄⣿⣿⣿⣷⣿⣿⡇⢀⠄⠤⠈⠁⣠⣠⣸⢠⠄⠄⠄⠄⠄ ',
                        ' ⢀⠄⠄⣿⣿⣷⣬⣵⣿⣿⣿⣿⣿⣿⣿⣷⣟⢷⡶⢗⡰⣿⣿⠇⠘⠄⠄⠄⠄⠄ ',
                        ' ⣿⠄⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⡟⢀⠃⠄⢸⡄⠁⣸ ',
                        ' ⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢄⡆⠄⢀⣪⡆⠄⣿ ',
                        ' ⡟⠄⠄⠄⠄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣟⣻⣩⣾⣃⣴⣿⣿⡇⠸⢾ ',
                        '                                ',
                    },
                    -- 显示加载的包
                    packages = { enable = true },
                    -- 关闭日期显示
                    week_header = {
                        enable = false,
                    },
                    -- 快捷键操作
                    shortcut = { --shortcut/center for hyper/doom
                        { action = "Lazy", group = "@property", desc = " Lazy", icon = "󰒲 ", key = "l" },
                        {
                            icon = " ",
                            desc = "Files",
                            group = "Label", --配色组
                            action = "Telescope find_files",
                            key = "f",
                        },
                        --指定搜索目录：action = 'Telescope find_files search_dirs=~/.config/',
                        -- { action = "LazyExtras", group = "DiagnosticHint", desc = " Lazy Extras", icon = " ", key = "x" },
                        { action = "Telescope live_grep", group = "Label", desc = "Text", icon = " ", key = "g" },
                        { action = "Telescope oldfiles", group = "Number", desc = "Oldfiles", icon = " ", key = "o" },
                        { action = 'lua require("persistence").load()', group = "Number", desc = "Session", icon = " ", key = "s" },
                        { action = "Telescope live_grep search_dirs=~/.config", group = "Label", desc = "Config", icon = " ", key = "c" },
                        { action = "Telescope live_grep search_dirs=~/study_md", group = "Label", desc = "Markdown", icon = " ", key = "m" },
                        { action = "qa", desc = " Quit", icon = " ", key = "q" },
                    },
                    --页脚文字
                    footer = function()
                        local quotes = {
                            "两情若是久长时 又岂在朝朝暮暮",
                        }

                        -- 随机选择一条名言
                        math.randomseed(os.time())
                        local random_quote = quotes[math.random(#quotes)]

                        -- 将随机名言放入一个表中并返回
                        return {
                            " ",
                            random_quote
                        }
                    end
                },
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons',
            'nvim-telescope/telescope.nvim',
        } }
    },
    -- NOTE: 主题部分:
    -- ---------------

    { --主题
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            -- 启用主题
            vim.cmd [[colorscheme tokyonight]]
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true
    },
    {
        'shaunsingh/nord.nvim',
        lazy = true
    }
}
