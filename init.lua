require('options')
require('keymaps')

--lazy.nvim的配置，如果没有安装lazynvim的化则会自动安装
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
--加载插件
require("lazy").setup("plugins")

--启动时候自动恢复上一次的sessions
--路径保存在~/.local/state/nvim/sessions
--vim.cmd([[lua require("persistence").load()]])
--启动时自动加载上一次的view,关闭时自动保存当时的view
--路径 保存在~/.local/state/nvim/view
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    command = "silent! loadview",
    nested = true,
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = "mkview",
    nested = true,
    --format when the buffer  save
})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = group,
--     buffer = bufnr,
--     callback = function() vim.lsp.buf.format { bufnr = bufnr, async = true } end
-- })

-- 创建一个名为 `HtmlPreview` 的自定义命令，用于执行Bracey命令时自动打开windows下的edge进行预览
vim.api.nvim_create_user_command(
    'HtmlPreview',  -- 命令名称
    function()
        vim.cmd('Bracey')
        local cmd = 'powershell.exe Start-Process "msedge.exe" "http://localhost:9999"'
        vim.fn.system(cmd)
    end,
    {}  -- 额外的选项（可选）
)



vim.cmd [[
sign define DiagnosticSignError text=  linehl= texthl=DiagnosticSignError numhl=
sign define DiagnosticSignWarn text= linehl= texthl=DiagnosticSignWarn numhl=
sign define DiagnosticSignInfo text=  linehl= texthl=DiagnosticSignInfo numhl=
sign define DiagnosticSignHint text=💡  linehl= texthl=DiagnosticSignHint numhl=
]]



