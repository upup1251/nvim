return {
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
