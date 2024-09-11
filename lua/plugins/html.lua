return {
    {
        'turbio/bracey.vim',
        config = function()
            vim.g.bracey_server_port = 9999
            -- 设置固定port，以通过init.lua中设置手动打开windows中的edge打开网页
            -- local cmd = 'powershell.exe Start-Process "msedge.exe" "http://localhost:9999"'
            -- vim.fn.system(cmd)
        end
    },

    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup()
        end
        
    }

}
