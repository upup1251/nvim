--lsp语言协议管理中心
--lsp.lua
return {
    -- NOTE: 从这里开始是配置LSP部分:
    -- ------------------------------
    --
    -- 下载所需语言服务
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup({
                -- some icons
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },

    --启用语言lsp
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
            vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
            -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
            -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
            -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
            -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
            -- vim.keymap.set('n', 'gT', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
            -- vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
            -- vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
            -- vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
            -- vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
            -- vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')



            --require 'lspconfig'.pyright.setup {}  --python
            require 'lspconfig'.clangd.setup {}   --C++
            require 'lspconfig'.marksman.setup {} --markdown
            require 'lspconfig'.asm_lsp.setup {}  --assmbly
            require 'lspconfig'.jsonls.setup {}   --json

            require 'lspconfig'.jdtls.setup {
                filetypes = { "java", "jsp" },
                autostart = true
            }                                 --java
            require 'lspconfig'.sqls.setup {} --sql
            require 'lspconfig'.pyright.setup {


            }
            require 'lspconfig'.html.setup {}
            require 'lspconfig'.cssls.setup {}
            require 'lspconfig'.volar.setup {
                init_options = {
                    -- 配置ts位置
                    typescript = {
                        tsdk = '/Users/upupup/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib'
                        -- Alternative location if installed as root:
                        -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
                    }
                }

            }
            require 'lspconfig'.ts_ls.setup {
                init_options = {
                    -- 配置vue插件
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = "/Users/upupup/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server",
                            languages = { "javascript", "typescript", "vue" },
                        },
                    },
                },
                filetypes = {
                    "javascript",
                    "typescript",
                    "vue",
                },
            }
            require 'lspconfig'.lua_ls.setup {
                vim.keymap.set('n', 'gf', function()
                    vim.lsp.buf.format { async = true }
                end, opts),
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { 'vim' },
                        },
                    },
                },
            }
        end
    },
    { -- improves lsp experience
        'nvimdev/lspsaga.nvim',
        lazy = true,
        event = "LspAttach",
        config = function()
            require('lspsaga').setup({
                --上端的动态位置栏
                symbol_in_winbar = {
                    enable = false,
                },
                vim.keymap.set('n', 'ga', '<cmd>Lspsaga code_action<cr>', {}),
                -- 函数定义
                vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<cr>', {}),
                vim.keymap.set('n', 'gD', '<cmd>Lspsaga goto_definition<cr>', {}),
                --类型定义
                vim.keymap.set('n', 'gp', '<cmd>Lspsaga peek_type_definition<cr>', {}),
                vim.keymap.set('n', 'gp', '<cmd>Lspsaga goto_type_definition<cr>', {}),
                --悬浮终端
                vim.keymap.set('n', 'gy', '<cmd>Lspsaga term_toggle<cr>', {}),
                --大纲
                vim.keymap.set('n', 'go', '<cmd>Lspsaga outline<cr>', {}),
                --查看函数说明
                vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', {}),
                -- jump to the prev/next error
                vim.keymap.set('n', 'g[', '<cmd>Lspsaga diagnostic_jump_prev<cr>', {}),
                vim.keymap.set('n', 'g]', '<cmd>Lspsaga diagnostic_jump_next<cr>', {}),
                --改名
                --Project-wide Replace 整个项目都改名需要单独配置
                vim.keymap.set('n', 'gn', ':lua vim.lsp.buf.rename<CR>', {}),
                -- the reference and implementation
                vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<cr>', {}),
                finder = {
                    keys = {
                        --在两个视口跳动
                        shuttle = ' ',
                    }
                },

            })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional,
            'nvim-tree/nvim-web-devicons'      -- optional
        }
    },

    {
        "mfussenegger/nvim-jdtls",
        ft = { "java" },
        config = function()
            local config = {
                cmd = { '/opt/homebrew/Cellar/jdtls/1.41.0/bin/jdtls' },
                root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
            }
            require('jdtls').start_or_attach(config)
        end
    },

    -- NOTE: 下面是使用LSP的插件
    -- ------------------------


    {
        "folke/trouble.nvim",
        event = "LspAttach",
        opts = {
            focus = true,

        }, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            -- 命令格式：Trouble [mode] [action] [options]
            {
                "<leader>ld",
                "<cmd>Trouble diagnostics toggle focus=true<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>ls",
                "<cmd>Trouble symbols toggle focus=true<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>ll",
                "<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
        },
    },

    { --这是一个语法高亮插件，使用lsp渲染
        'nvim-treesitter/nvim-treesitter',
        -- we should add the paser per language
        -- to do it , we can use :TSInstall language_name
        -- to know what language paser we have,we can use :TSInstallInfo
        lazy = true,
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "markdown", "markdown_inline", "html" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
            }
        end
    },

    { -- 面包屑插件，顶部显示当前所在lsp层次
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            show_dirname = false,
        },
    },


    -- { --垂直线插件
    --     -- require the treesitter
    --     -- The scope is not the current indentation level!
    --     -- Instead, it is the indentation level where variables or functions are accessible
    --     "lukas-reineke/indent-blankline.nvim",
    --     event = "LspAttach",
    --     config = function()
    --         -- set mutiple indent colors
    --         local highlight = {
    --             "RainbowRed",
    --             "RainbowYellow",
    --             "RainbowBlue",
    --             "RainbowOrange",
    --             "RainbowGreen",
    --             "RainbowViolet",
    --             "RainbowCyan",
    --         }
    --         local hooks = require "ibl.hooks"
    --         hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    --             vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    --             vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    --             vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    --             vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    --             vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    --             vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    --             vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    --         end)
    --         -- 与rainbow-delimiters集成
    --         vim.g.rainbow_delimiters = { highlight = highlight }
    --         -- start the plugin
    --         require("ibl").setup {
    --             scope = { highlight = highlight },
    --             exclude = {
    --                 filetypes = {
    --                     "help",
    --                     "alpha",
    --                     "dashboard",
    --                     "neo-tree",
    --                     "Trouble",
    --                     "trouble",
    --                     "lazy",
    --                     "mason",
    --                     "notify",
    --                     "toggleterm",
    --                     "lazyterm",
    --                 }
    --             }
    --         }
    --         hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    --     end
    -- },




}
