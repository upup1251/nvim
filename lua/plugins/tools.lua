--nvim-tree,telescope,markdown
return {
    { --this is the dir tree tool
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = true,
        keys = {
            { "gt", mode = "n" }
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            --这里是键位映射
            vim.keymap.set('n', 'gt', ":NvimTreeOpen<CR>")
            vim.keymap.set('n', 'gT', ":NvimTreeClose<CR>")
            local function my_on_attach(bufnr)
                local api = require('nvim-tree.api')
                local function opts(desc)
                    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end
                vim.keymap.set('n', 'l', api.tree.change_root_to_node, opts('CD'))
                vim.keymap.set('n', 'h', api.tree.change_root_to_parent, opts('Up'))
                vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
                vim.keymap.set('n', 'a', api.fs.create, opts('Create File Or Directory'))
                vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
                vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
                vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
                vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
                vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
                vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
                vim.keymap.set('n', 's', api.tree.search_node, opts('Search'))
            end
            -- 这里是config
            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- optionally enable 24-bit colour
            vim.opt.termguicolors = true

            -- empty setup using defaults
            require("nvim-tree").setup({
                on_attach = my_on_attach,
            })
        end,
    },

    { -- file find tool
        'nvim-telescope/telescope.nvim',
        lazy = true,
        keys = {
            "<leader>ff", "<leader>fg", "<leader>fb"
        },
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").setup {
                vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {}),
                vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {}),
                vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {}),
                vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {}),

                defaults = {
                    mappings = {
                        i = {
                            ["<C-c>"] = require "telescope.actions".close,
                        },
                        n = {
                            ["<esc>"] = require "telescope.actions".close,
                            ["q"] = require "telescope.actions".close,
                            ["<CR>"] = require "telescope.actions".select_default,
                            ["o"] = require("telescope.actions").select_default,

                            ["x"] = require "telescope.actions".select_horizontal,
                            ["v"] = require "telescope.actions".select_vertical,

                            ["<Tab>"] = require "telescope.actions".toggle_selection + require "telescope.actions".move_selection_worse,
                            ["j"] = require "telescope.actions".move_selection_next,
                            ["k"] = require "telescope.actions".move_selection_previous,
                            ["gg"] = require "telescope.actions".move_to_top,
                            ["G"] = require "telescope.actions".move_to_bottom,

                            ["K"] = require "telescope.actions".preview_scrolling_up,
                            ["J"] = require "telescope.actions".preview_scrolling_down,
                            ["H"] = require "telescope.actions".preview_scrolling_left,
                            ["L"] = require "telescope.actions".preview_scrolling_right,

                            ["?"] = require "telescope.actions".which_key,
                        }
                    }
                }
            }
        end
    },

    { --the markdown preview tool
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    { --这是自动保存、手动加载sessions的插件
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = vim.opt.sessionoptions:get() },
        -- stylua: ignore
        keys = {
            { "<leader>ls", function() require("persistence").load() end, desc = "Restore Session" },
        },
    },

    {                  --the surroud add/change/del tools
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "LspAttach",
        config = function()
            require("nvim-surround").setup({
            })
        end
        --use:
        --add:ys{motion}{char}
        --delete:ds{char}
        --change:cs{tarfet}{repalcement}
    },

    { --the is a comment helper
        'numToStr/Comment.nvim',
        lazy = true,
        event = "LspAttach",
        opts = {
            -- add any options here
        },
        config = function()
            require('Comment').setup()
        end
        -- use:
        -- `gcc` - Toggles the current line using linewise comment
        -- `gbc` - Toggles the current line using blockwise comment
        -- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
        -- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
        -- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
        -- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
    },

    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
}
