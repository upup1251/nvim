-- 数据库
return {
    {
      'tpope/vim-dadbod'
    },

    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        keys = {
            "<leader>su",
        },
        init = function()
            -- Your DBUI configuration
            -- the file  save in the ~/.local/share/db_ui
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_show_help = 0
            vim.g.db_ui_winwidth = 30
        end,
        config = function()
            vim.keymap.set({ "n" }, "<leader>su", "<cmd>DBUI<CR>")
            vim.keymap.set({ "n" }, "gt", "<cmd>DBUIToggle<CR>")
        end
    }
    -- url for mysql
    -- mysql://<username>:<password>@<host>:<port>/<db_name>
}
