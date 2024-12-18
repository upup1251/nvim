return {
    {
        "kndndrj/nvim-dbee",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        build = function()
            require("dbee").install()
        end,

        keys = {
            { "<leader>db", "<cmd>Dbee toggle<cr>", desc = "toggle Dbee ui" },
        },
        config = function()
            require("dbee").setup({
                sources = {
                    require("dbee.sources").MemorySource:new({
                        -- 将会展示mysql中所有的数据库，但是只有指定的数据库才能访问
                        {
                            name = "Hospital",
                            url = "upupup:tianqi985@tcp(127.0.0.1:3306)/hospital",
                            type = "mysql"
                        },
                        {
                            name = "book",
                            url = "upupup:tianqi985@tcp(127.0.0.1:3306)/book",
                            type = "mysql"
                        }

                    }),
                    -- 通过环境变量添加源
                    -- require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
                    -- 通过json文件
                    -- require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
                }
            })
        end,
        -- useage:
        -- Drawer
        --      node:
        --          o : toggle节点展开状态
        --          r : 刷新节点树
        --      connection:
        --          <CR> : 改变激活的连接
        --          <CR> on table : 列出在表上可执行的操作
        --      note:
        --          <CR> on new node : 创建新的note
        --          <CR> on exisited node : 打开已有note
        --          :w  : save note to disk
        --          cw  : 重命名
        --          dd  : 删除note
        --run:
        --    {Visual} BB: 在激活的连接上执行选择的sql语句
        --    BB : 执行编辑窗口内的所有sql语句
        --result:
        --    L/H : 下/上一页
        --    E/F : 最后/第一页
        --    yaj/yac : 将当前行提取为json/CSV
        --    yaJ/yaC : 将所有行提取为json/CSV
    },
}
