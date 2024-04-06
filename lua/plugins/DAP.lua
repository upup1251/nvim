return {
    { --debugger程序
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            "theHamsta/nvim-dap-virtual-text",
        },
        lazy = true,
        keys = {
            "<leader>b",
        },
        config = function()
            -- here is  the  ui icon
            vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
            vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
            vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
            vim.fn.sign_define('DapBreakpoint',
                { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointCondition',
                { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointRejected',
                { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
            vim.fn.sign_define('DapLogPoint',
                { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
            vim.fn.sign_define('DapStopped', {
                text = '',
                texthl = 'DapStopped',
                linehl = 'DapStopped',
                numhl =
                'DapStopped'
            })
            vim.keymap.set({ "i", "n", "v" }, "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
                { silent = true, noremap = true, buffer = bufnr })
            vim.keymap.set({ "i", "n", "v" }, "<leader>c", "<cmd>lua require'dap'.continue()<CR>",
                { silent = true, noremap = true, buffer = bufnr })
            vim.keymap.set({ "i", "n", "v" }, "<leader>n", "<cmd>lua require'dap'.step_over()<CR>",
                { silent = true, noremap = true, buffer = bufnr })
            vim.keymap.set({ "i", "n", "v" }, "<leader>i", "<cmd>lua require'dap'.step_into()<CR>",
                { silent = true, noremap = true, buffer = bufnr })
            vim.keymap.set({ "i", "n", "v" }, "<leader>q",
                "<cmd>lua require'dap'.disconnect()<CR><cmd>lua require'dap'.close()<CR><cmd>lua require('dapui').close()<cr>",
                { silent = true, noremap = true, buffer = bufnr })
            --
            --c++------------------------------------------------
            require("dap").adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-i", "dap" }
            }
            local dap                   = require("dap")
            dap.configurations.cpp      = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        --g++ -g hi.cpp -o hi
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = "${workspaceFolder}",
                },
            }
            --java------------------------------------------------
            dap.adapters.java           = function(callback)
                -- FIXME:
                -- Here a function needs to trigger the `vscode.java.startDebugSession` LSP command
                -- The response to the command must be the `port` used below
                callback({
                    type = 'server',
                    host = '127.0.0.1',
                    port = port,
                })
            end
            dap.configurations.java     = {
                {
                    type = 'java',
                    request = 'attach',
                    name = "Debug (Attach) - Remote",
                    hostName = "127.0.0.1",
                    port = 5005,
                },
            }
            dap.configurations.java     = {
                {
                    -- You need to extend the classPath to list your dependencies.
                    -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
                    classPaths = {},

                    -- If using multi-module projects, remove otherwise.
                    projectName = "yourProjectName",

                    javaExec = "/path/to/your/bin/java",
                    mainClass = "your.package.name.MainClassName",

                    -- If using the JDK9+ module system, this needs to be extended
                    -- `nvim-jdtls` would automatically populate this property
                    modulePaths = {},
                    name = "Launch YourClassName",
                    request = "launch",
                    type = "java"
                },
            }
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        opts = {}
    },
    { --dap的gui图形界面
        'rcarriga/nvim-dap-ui',
        lazy = true,
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
            require("dapui").setup()
            local dap, dapui = require("dap"), require("dapui")
            --随着dap的启动关闭自动开启关闭ui
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    }
}
