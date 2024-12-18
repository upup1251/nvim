return {
    -- for markdown
    {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        config = function()
            vim.keymap.set('n', '<leader>mm', '<cmd>MarkdownPreview<cr>', {})
        end,
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {},
        ft = { "markdown" },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        config = function()
            require('render-markdown').setup({
                pipe_table = { preset = 'round' },
                heading = {
                    sign = false,
                    position = 'inline',
                    width = 'block',
                    left_margin = 0.5,
                    left_pad = 0.2,
                    right_pad = 0.2,
                },
            })
        end
    },

    {
        "3rd/image.nvim",
        ft = { "markdown" },
        config = function()
            require("image").setup({
                backend = "kitty",
                kitty_method = "normal",
                integrations = {
                    -- Notice these are the settings for markdown files
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        -- Set this to false if you don't want to render images coming from
                        -- a URL
                        download_remote_images = true,
                        -- Change this if you would only like to render the image where the
                        -- cursor is at
                        -- I set this to true, because if the file has way too many images
                        -- it will be laggy and will take time for the initial load
                        only_render_image_at_cursor = true,
                        -- markdown extensions (ie. quarto) can go here
                        filetypes = { "markdown", "vimwiki" },
                        sizing_strategy = "auto",
                    },
                    neorg = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = false,
                        filetypes = { "norg" },
                    },
                    -- This is disabled by default
                    -- Detect and render images referenced in HTML files
                    -- Make sure you have an html treesitter parser installed
                    -- ~/github/dotfiles-latest/neovim/nvim-lazyvim/lua/plugins/treesitter.lua
                    html = {
                        enabled = false,
                    },
                    -- This is disabled by default
                    -- Detect and render images referenced in CSS files
                    -- Make sure you have a css treesitter parser installed
                    -- ~/github/dotfiles-latest/neovim/nvim-lazyvim/lua/plugins/treesitter.lua
                    css = {
                        enabled = true,
                    },
                },
                max_width = nil,
                max_height = nil,
                max_width_window_percentage = nil,
                -- This is what I changed to make my images look smaller, like a
                -- thumbnail, the default value is 50
                -- max_height_window_percentage = 20,
                max_height_window_percentage = 40,
                -- toggles images when windows are overlapped
                window_overlap_clear_enabled = true,
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },

                editor_only_render_when_focused = false,
                -- render image files as images when opened
                hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
            })
        end,
    },

    {
        "HakonHarnes/img-clip.nvim",
        ft = { "markdonw" },
        opts = {
            default = {
                prompt_for_file_name = false,
                copy_images = true,
            }
        },
        keys = {
            -- suggested keymap
            { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
        },
    },

    --  [markdown markmap]
    --  https://github.com/Zeioth/markmap.nvim
    --  先安装markmap-cli工具
    {
        "Zeioth/markmap.nvim",
        build = "yarn global add markmap-cli",
        cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
        ft = { "markdown" },
        opts = {
            html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
            hide_toolbar = false,              -- (default)
            grace_period = 3600000             -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
        },
        config = function(_, opts) require("markmap").setup(opts) end
    },



    -- for web html
    {
        'turbio/bracey.vim',
        ft = { "html" },
        config = function()
        end
        -- question:bracey error: <urlopen error [Errno 111] Connection refused>
        -- answer:go to the folder where bracey is installed with your plugin manager then run command:`npm install --prefix server`

    },
    {
        'norcalli/nvim-colorizer.lua',
        ft = { "html", "css" },
        config = function()
            require 'colorizer'.setup()
        end

    }
}
