VimUnDoå Ž³PAP®uš»ZDĆ»ŠsµĀgś	ä5ĢóLź)                                      gbc    _Š                             ’’’’                                                                                                                                                                                                                                                                                                                                                             g@     õ                   5õ                                                  5_Š                           ’’’’                                                                                                                                                                                                                                                                                                                                                             g@     õ                  return 5õ                                                5_Š                           ’’’’                                                                                                                                                                                                                                                                                                                                                             g@    õ                return {õ                }õ                  	return {}5õ                                                õ                                                õ                          	                      õ                         
                      õ                          	                      5_Š                            ’’’’                                                                                                                                                                                                                                                                                                                                                             g@9     õ             õ             5õ                          
               Z      5_Š                            ’’’’                                                                                                                                                                                                                                                                                                                                                             g@;     õ                  õ                  return {           {   '        "iamcco/markdown-preview.nvim",   )        build = "cd app && yarn install",           init = function()   1            vim.g.mkdp_filetypes = { "markdown" }           end,           config = function()   M            vim.keymap.set('n', '<leader>mm', '<cmd>MarkdownPreview<cr>', {})           end,           ft = { "markdown" },       },           {   4        'MeanderingProgrammer/render-markdown.nvim',           opts = {},           ft = { "markdown" },           dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons           config = function()   .            require('render-markdown').setup({   2                pipe_table = { preset = 'round' },                   heading = {   !                    sign = false,   (                    position = 'inline',   $                    width = 'block',   &                    left_margin = 0.5,   #                    left_pad = 0.2,   $                    right_pad = 0.2,                   },               })           end       },               {   S        -- luarocks.nvim is a Neovim plugin designed to streamline the installation   Q        -- of luarocks packages directly within Neovim. It simplifies the process   N        -- of managing Lua dependencies, ensuring a hassle-free experience for           -- Neovim users.   2        -- https://github.com/vhyrro/luarocks.nvim           "vhyrro/luarocks.nvim",   8        -- this plugin needs to run before anything else           priority = 1001,           opts = {   !            rocks = { "magick" },   
        },       },           {           "3rd/image.nvim",   *        dependencies = { "luarocks.nvim"},           ft = {"markdown"},           config = function()   $            require("image").setup({   "                backend = "kitty",   (                kitty_method = "normal",                    integrations = {   G                    -- Notice these are the settings for markdown files                        markdown = {   '                        enabled = true,   5                        clear_in_insert_mode = false,   [                        -- Set this to false if you don't want to render images coming from                            -- a URL   6                        download_remote_images = true,   [                        -- Change this if you would only like to render the image where the   '                        -- cursor is at   Z                        -- I set this to true, because if the file has way too many images   S                        -- it will be laggy and will take time for the initial load   ;                        only_render_image_at_cursor = true,   G                        -- markdown extensions (ie. quarto) can go here   >                        filetypes = { "markdown", "vimwiki" },                       },                       neorg = {   '                        enabled = true,   5                        clear_in_insert_mode = false,   6                        download_remote_images = true,   <                        only_render_image_at_cursor = false,   /                        filetypes = { "norg" },                       },   2                    -- This is disabled by default   H                    -- Detect and render images referenced in HTML files   M                    -- Make sure you have an html treesitter parser installed   ^                    -- ~/github/dotfiles-latest/neovim/nvim-lazyvim/lua/plugins/treesitter.lua                       html = {   (                        enabled = false,                       },   2                    -- This is disabled by default   G                    -- Detect and render images referenced in CSS files   K                    -- Make sure you have a css treesitter parser installed   ^                    -- ~/github/dotfiles-latest/neovim/nvim-lazyvim/lua/plugins/treesitter.lua                       css = {   '                        enabled = true,                       },                   },                    max_width = nil,   !                max_height = nil,   2                max_width_window_percentage = nil,   P                -- This is what I changed to make my images look smaller, like a   5                -- thumbnail, the default value is 50   5                -- max_height_window_percentage = 20,   2                max_height_window_percentage = 40,   =                -- toggles images when windows are overlapped   4                window_overlap_clear_enabled = true,   P                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },       8                editor_only_render_when_focused = false,   ;                -- render image files as images when opened   c                hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },               })           end,       },           {   $        "HakonHarnes/img-clip.nvim",           ft = {"markdonw"},           opts = {               default = {   -                prompt_for_file_name = false,   #                copy_images = true,               }   
        },           keys = {               -- suggested keymap   _            { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },   
        },       },           --  [markdown markmap]   .    --  https://github.com/Zeioth/markmap.nvim   "    --  åå®č£markmap-cliå·„å·       {           "Zeioth/markmap.nvim",   .        build = "yarn global add markmap-cli",   S        cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },           ft = { "markdown" },           opts = {   |            html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html   ;            hide_toolbar = false,              -- (default)               grace_period = 3600000             -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.   
        },   E        config = function(_, opts) require("markmap").setup(opts) end       },   }5õ                                 e      k      õ                          k                     5_Š                            ’’’’                                                                                                                                                                                                                                                                                                                                                             g@<    õ                 5õ                          	                      5_Š                            ’’’’                                                                                                                                                                                                                                                                                                                                                             gA5|     õ   
                     ft = { "markdown" },5õ    
                      1                     5_Š      	                      ’’’’                                                                                                                                                                                                                                                                                                                                                             gA5}     õ             õ             5õ                          7                      5_Š      
           	   #        ’’’’                                                                                                                                                                                                                                                                                                                            #          /          V       gA64     õ   "   #              {   S        -- luarocks.nvim is a Neovim plugin designed to streamline the installation   Q        -- of luarocks packages directly within Neovim. It simplifies the process   N        -- of managing Lua dependencies, ensuring a hassle-free experience for           -- Neovim users.   2        -- https://github.com/vhyrro/luarocks.nvim           "vhyrro/luarocks.nvim",   8        -- this plugin needs to run before anything else           priority = 1001,           opts = {   !            rocks = { "magick" },   
        },       },5õ    "                      ņ      ž              5_Š   	              
   !        ’’’’                                                                                                                                                                                                                                                                                                                            #          #          V       gA6x     õ       !               5õ                           š                     5_Š   
                 $        ’’’’                                                                                                                                                                                                                                                                                                                            !          !          V       gA6    õ   #   $          +        dependencies = { "luarocks.nvim" },5õ    #                            ,               5_Š                    7   =    ’’’’                                                                                                                                                                                                                                                                                                                            !          !          V       gA88     õ   7   9                                 õ   7   9       5õ    7                      M                     õ    7                     e                     õ    7                    k                    õ    7   +                  x                     õ    7   *                  w                     5_Š                    8   *    ’’’’                                                                                                                                                                                                                                                                                                                            !          !          V       gA8C     õ   7   9         *                        sizing_strategy = 5õ    7   *                  w                     5_Š                    8   +    ’’’’                                                                                                                                                                                                                                                                                                                            !          !          V       gA8D    õ   7   9         ,                        sizing_strategy = ""5õ    7   +                  x                     5_Š                    8   0    ’’’’                                                                                                                                                                                                                                                                                                                            !          !          V       gA8F    õ   7   9         0                        sizing_strategy = "auto"5õ    7   0                  }                     5_Š                            ’’’’                                                                                                                                                                                                                                                                                                                                                             gb+    õ                   õ             5õ                          	                      õ                          	                      õ                                               õ                                             5_Š                            ’’’’                                                                                                                                                                                                                                                                                                                                                             gb4    õ               5õ                                               5_Š                            ’’’’                                                                                                                                                                                                                                                                                                                                                             gb5   	 õ                   õ             5õ                                               õ                                               õ                                              õ                                               õ                                              õ                                               õ                                              õ                                              õ                                      	       õ                                              õ                                              õ                                              õ                                              õ                                              õ                                              õ                                              õ                                               õ                                              õ                                              õ                                              õ                                              õ                                              õ                                            5_Š                           ’’’’                                                                                                                                                                                                                                                                                                                                                             gb]   
 õ                   --- õ             5õ                                        	       õ                         ”                     õ                                               õ                                              õ                                              õ                                              õ                                              õ                                              õ                                               5_Š                            ’’’’                                                                                                                                                                                                                                                                                                                                                             gb_     õ             õ             5õ                                        ę      5_Š                           ’’’’                                                                                                                                                                                                                                                                                                                                                             gb`     õ                   --- for web html5õ                                              5_Š                           ’’’’                                                                                                                                                                                                                                                                                                                                                             gba     õ                  õ                  return {       -- for markdown       {   '        "iamcco/markdown-preview.nvim",           ft = { "markdown" },   )        build = "cd app && yarn install",           init = function()   1            vim.g.mkdp_filetypes = { "markdown" }           end,           config = function()   M            vim.keymap.set('n', '<leader>mm', '<cmd>MarkdownPreview<cr>', {})           end,       },           {   4        'MeanderingProgrammer/render-markdown.nvim',           opts = {},           ft = { "markdown" },           dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons           config = function()   .            require('render-markdown').setup({   2                pipe_table = { preset = 'round' },                   heading = {   !                    sign = false,   (                    position = 'inline',   $                    width = 'block',   &                    left_margin = 0.5,   #                    left_pad = 0.2,   $                    right_pad = 0.2,                   },               })           end       },           {           "3rd/image.nvim",           ft = { "markdown" },           config = function()   $            require("image").setup({   "                backend = "kitty",   (                kitty_method = "normal",                    integrations = {   G                    -- Notice these are the settings for markdown files                        markdown = {   '                        enabled = true,   5                        clear_in_insert_mode = false,   [                        -- Set this to false if you don't want to render images coming from                            -- a URL   6                        download_remote_images = true,   [                        -- Change this if you would only like to render the image where the   '                        -- cursor is at   Z                        -- I set this to true, because if the file has way too many images   S                        -- it will be laggy and will take time for the initial load   ;                        only_render_image_at_cursor = true,   G                        -- markdown extensions (ie. quarto) can go here   >                        filetypes = { "markdown", "vimwiki" },   1                        sizing_strategy = "auto",                       },                       neorg = {   '                        enabled = true,   5                        clear_in_insert_mode = false,   6                        download_remote_images = true,   <                        only_render_image_at_cursor = false,   /                        filetypes = { "norg" },                       },   2                    -- This is disabled by default   H                    -- Detect and render images referenced in HTML files   M                    -- Make sure you have an html treesitter parser installed   ^                    -- ~/github/dotfiles-latest/neovim/nvim-lazyvim/lua/plugins/treesitter.lua                       html = {   (                        enabled = false,                       },   2                    -- This is disabled by default   G                    -- Detect and render images referenced in CSS files   K                    -- Make sure you have a css treesitter parser installed   ^                    -- ~/github/dotfiles-latest/neovim/nvim-lazyvim/lua/plugins/treesitter.lua                       css = {   '                        enabled = true,                       },                   },                    max_width = nil,   !                max_height = nil,   2                max_width_window_percentage = nil,   P                -- This is what I changed to make my images look smaller, like a   5                -- thumbnail, the default value is 50   5                -- max_height_window_percentage = 20,   2                max_height_window_percentage = 40,   =                -- toggles images when windows are overlapped   4                window_overlap_clear_enabled = true,   P                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },       8                editor_only_render_when_focused = false,   ;                -- render image files as images when opened   c                hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },               })           end,       },           {   $        "HakonHarnes/img-clip.nvim",           ft = { "markdonw" },           opts = {               default = {   -                prompt_for_file_name = false,   #                copy_images = true,               }   
        },           keys = {               -- suggested keymap   _            { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },   
        },       },           --  [markdown markmap]   .    --  https://github.com/Zeioth/markmap.nvim   "    --  åå®č£markmap-cliå·„å·       {           "Zeioth/markmap.nvim",   .        build = "yarn global add markmap-cli",   S        cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },           ft = { "markdown" },           opts = {   |            html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html   ;            hide_toolbar = false,              -- (default)               grace_period = 3600000             -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.   
        },   E        config = function(_, opts) require("markmap").setup(opts) end       },                   -- for web html           {           'turbio/bracey.vim',           ft = { "html" },           config = function()           end   P        -- question:bracey error: <urlopen error [Errno 111] Connection refused>           -- answer:go to the folder where bracey is installed with your plugin manager then run command:`npm install --prefix server`           },       {   &        'norcalli/nvim-colorizer.lua',           ft = { "html", "css" },           config = function()   '            require 'colorizer'.setup()           end           }   }    5õ                                              õ                                               5_Š                             ’’’’                                                                                                                                                                                                                                                                                                                                                             gbb    õ                 5õ                                               5ēŖ