Vim�UnDo� �!F���� ���k���"��%��`�⚺S�   �                                  gb'    _�                             ����                                                                                                                                                                                                                                                                                                                            �                      V        gb�     �               �   return {       { --debugger程序            'mfussenegger/nvim-dap',           keys = {               "<leader>b",   
        },           dependencies = {   #            'rcarriga/nvim-dap-ui',   .            "theHamsta/nvim-dap-virtual-text",   
        },           config = function()   $            -- here is  the  ui icon   d            vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })   b            vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })   a            vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })   /            vim.fn.sign_define('DapBreakpoint',   n                { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })   8            vim.fn.sign_define('DapBreakpointCondition',   n                { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })   7            vim.fn.sign_define('DapBreakpointRejected',   n                { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })   -            vim.fn.sign_define('DapLogPoint',   h                { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })   .            vim.fn.sign_define('DapStopped', {                   text = '',   &                texthl = 'DapStopped',   &                linehl = 'DapStopped',                   numhl =                   'DapStopped'               })   a            vim.keymap.set({ "n" }, "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>",   B                { silent = true, noremap = true, buffer = bufnr })   X            vim.keymap.set({ "n" }, "<leader>c", "<cmd>lua require'dap'.continue()<CR>",   B                { silent = true, noremap = true, buffer = bufnr })   Y            vim.keymap.set({ "n" }, "<leader>n", "<cmd>lua require'dap'.step_over()<CR>",   B                { silent = true, noremap = true, buffer = bufnr })   Y            vim.keymap.set({ "n" }, "<leader>i", "<cmd>lua require'dap'.step_into()<CR>",   B                { silent = true, noremap = true, buffer = bufnr })   0            vim.keymap.set({ "n" }, "<leader>q",                   "<cmd>lua require'dap'.disconnect()<CR><cmd>lua require'dap'.close()<CR><cmd>lua require('dapui').close()<cr>",   B                { silent = true, noremap = true, buffer = bufnr })               --   A            --c++------------------------------------------------   +            require("dap").adapters.gdb = {   $                type = "executable",                    command = "gdb",   &                args = { "-i", "dap" }               }   8            local dap                   = require("dap")   +            dap.configurations.cpp      = {                   {   $                    name = "Launch",   !                    type = "gdb",   '                    request = "launch",   (                    program = function()   -                        --g++ -g hi.cpp -o hi   c                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')                       end,   /                    cwd = "${workspaceFolder}",                   },               }   B            --java------------------------------------------------   <            dap.adapters.java           = function(callback)                   -- FIXME:   c                -- Here a function needs to trigger the `vscode.java.startDebugSession` LSP command   L                -- The response to the command must be the `port` used below                   callback({   $                    type = 'server',   '                    host = '127.0.0.1',                        port = port,                   })               end   +            dap.configurations.java     = {                   {   "                    type = 'java',   '                    request = 'attach',   5                    name = "Debug (Attach) - Remote",   +                    hostName = "127.0.0.1",                        port = 5005,                   },               }   +            dap.configurations.java     = {                   {   R                    -- You need to extend the classPath to list your dependencies.   f                    -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing   $                    classPaths = {},       H                    -- If using multi-module projects, remove otherwise.   4                    projectName = "yourProjectName",       8                    javaExec = "/path/to/your/bin/java",   B                    mainClass = "your.package.name.MainClassName",       R                    -- If using the JDK9+ module system, this needs to be extended   N                    -- `nvim-jdtls` would automatically populate this property   %                    modulePaths = {},   2                    name = "Launch YourClassName",   '                    request = "launch",   !                    type = "java"                   },               }           end       },       {   *        "theHamsta/nvim-dap-virtual-text",           lazy = true       },       { --dap的gui图形界面           'rcarriga/nvim-dap-ui',           lazy = true,   3        dependencies = { "nvim-neotest/nvim-nio" },           config = function()   $            require("dapui").setup()   ?            local dap, dapui = require("dap"), require("dapui")   :            --随着dap的启动关闭自动开启关闭ui   A            dap.listeners.before.attach.dapui_config = function()                   dapui.open()               end   A            dap.listeners.before.launch.dapui_config = function()                   dapui.open()               end   K            dap.listeners.before.event_terminated.dapui_config = function()                   dapui.close()               end   G            dap.listeners.before.event_exited.dapui_config = function()                   dapui.close()               end           end,       }   }5��            �       �               W      �      5�_�                            ����                                                                                                                                                                                                                                                                                                                            �                      V        gb�    �          �      -- �          �    5��                                                  �                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                            �                      V        gb    �         �    5��                                                �                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             gb!    �          �      -- �          �    5��                                                  �                                                �                                                �                                                  �                                                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             gb$     �         �       �         �    5��                                                �                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             gb%     �         �      return 5��                                               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             gb&    �         �      return {�                }�         �      	return {}5��                         	                      �                         	                      �                          
                      �                          
                      5��