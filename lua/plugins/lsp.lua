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
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        --vim.keymap.set('n', '<space>e', vim.diagnostic.open_float),
        --vim.keymap.set('n', '[d', vim.diagnostic.goto_prev),
        --vim.keymap.set('n', ']d', vim.diagnostic.goto_next),
        --vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist),
        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
--        vim.api.nvim_create_autocmd('LspAttach', {
--            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
--                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
--                local opts = { buffer = ev.buf }
--                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--                vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
--                vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
--                vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, opts)
--                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    --             vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts),
--                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                --刷新
--                vim.keymap.set('n', '<space>fm', function()
--                    vim.lsp.buf.format { async = true }
--              end, opts)
--              --the workspace folder
--              vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--              vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--              vim.keymap.set('n', '<space>wl', function()
--                  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--              end, opts)
--          end,
--      }),

        config = function()
            require 'lspconfig'.pyright.setup {}  --python
            require 'lspconfig'.clangd.setup {}   --C++
            require 'lspconfig'.marksman.setup {} --C++
            require 'lspconfig'.lua_ls.setup {}   --lua
            require 'lspconfig'.jdtls.setup {}    --java
            require 'lspconfig'.sqls.setup {}     --sql
            require 'lspconfig'.lua_ls.setup {
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
    {-- improves lsp experience
    'nvimdev/lspsaga.nvim',
    lazy = true,
    event = "LspAttach",
    config = function()
        require('lspsaga').setup({
            --悬浮终端
            vim.keymap.set('n', 'gy', '<cmd>Lspsaga term_toggle<cr>',{}),
            -- 函数定义 
            vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<cr>',{}),
            vim.keymap.set('n', 'gD', '<cmd>Lspsaga goto_definition<cr>',{}),
            --大纲 
            vim.keymap.set('n', 'go', '<cmd>Lspsaga outline<cr>',{}),
            --查看函数说明
            vim.keymap.set('n', 'gh', '<cmd>Lspsaga hover_doc<cr>',{}),
            -- jump to the prev/next error
            vim.keymap.set('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>',{}),
            vim.keymap.set('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>',{}),
            --改名
            vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>',{}),
            -- the reference and implementation
            vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<cr>',{}),
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
        'nvim-tree/nvim-web-devicons'     -- optional
    }
    }
}
