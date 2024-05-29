--lsp语言协议管理中心
return {
    --下载所需语言服务
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
            --require 'lspconfig'.pyright.setup {}  --python
            require 'lspconfig'.clangd.setup {}   --C++
            require 'lspconfig'.marksman.setup {} --markdown
            require 'lspconfig'.jdtls.setup {}    --java
            require 'lspconfig'.sqls.setup {}     --sql
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
                --悬浮终端
                vim.keymap.set('n', 'gy', '<cmd>Lspsaga term_toggle<cr>', {}),
                -- 函数定义
                vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<cr>', {}),
                vim.keymap.set('n', 'gD', '<cmd>Lspsaga goto_definition<cr>', {}),
                --大纲
                vim.keymap.set('n', 'go', '<cmd>Lspsaga outline<cr>', {}),
                --查看函数说明
                vim.keymap.set('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', {}),
                -- jump to the prev/next error
                vim.keymap.set('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', {}),
                vim.keymap.set('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', {}),
                --改名
                vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', {}),
                -- the reference and implementation
                vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<cr>', {}),
                finder = {
                    keys = {
                        --在两个视口跳动
                        shuttle = ' ',
                    }
                },
                --上端的动态位置栏
                symbol_in_winbar = {
                    enable = true,
                },


            })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional,
            'nvim-tree/nvim-web-devicons'  -- optional
        }
    }
}
