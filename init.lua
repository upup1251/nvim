-- init.lua
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
require("lazy").setup("plugins", {
    rocks = {
        hererocks = true,
    },
})

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
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
    pattern = "*",
    callback = function()
        -- 检查当前缓冲区是否有文件名
        if vim.fn.bufname() ~= "" and vim.fn.getbufvar(0, "&modifiable") == 1 then
            -- 保存视图
            vim.cmd("silent! mkview")
        end
    end,
    nested = true,
})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = group,
--     buffer = bufnr,
--     callback = function() vim.lsp.buf.format { bufnr = bufnr, async = true } end
-- })

-- -- 打开文件时自动切换到文件所在目录
-- -- the option 'autochdir' may be can do it
-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function()
--         local bufname = vim.fn.expand('%:p:h')
--         if bufname ~= '' then
--             vim.cmd('cd ' .. bufname)
--         end
--     end,
-- })


--自动保存
vim.api.nvim_create_augroup("auto_save", { clear = true })
vim.api.nvim_create_autocmd("InsertLeave", {
    group = "auto_save",
    pattern = "*",
    callback = function() vim.cmd("silent! write") end
})



-- 切换模式自动退出snip绑定
function leave_snippet()
    if
        ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
        require('luasnip').unlink_current()
    end
end

-- stop snippets when you leave to normal mode
vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])


-- 打开 Dashboard
-- 自从把<caps_lock>变成进入normal模式后，发现太容易误触了，还是算了哈哈哈哈哈，自己的配置就是好，想改就怎么改
-- vim.api.nvim_set_keymap('n', '<ESC>', ':Dashboard<CR>', { noremap = true, silent = true })
-- 在 Dashboard 中按 ESC 关闭
vim.cmd([[
  autocmd FileType dashboard nnoremap <buffer> <ESC> :bd<CR>
]])

vim.cmd [[
sign define DiagnosticSignError text=  linehl= texthl=DiagnosticSignError numhl=
sign define DiagnosticSignWarn text= linehl= texthl=DiagnosticSignWarn numhl=
sign define DiagnosticSignInfo text=  linehl= texthl=DiagnosticSignInfo numhl=
sign define DiagnosticSignHint text=💡  linehl= texthl=DiagnosticSignHint numhl=
]]


-- here is my todo shortcut only in markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.keymap.set('n', 't', function()
            local line = vim.api.nvim_get_current_line()
            -- 检查当前行是否包含 "- [ ]"
            if line:find("%- %[ %]") then
                -- 使用 Vim 的替换命令将 "- [ ]" 替换为 "- [x]"
                vim.cmd('s/- \\[ \\] \\(.*\\)/- [x] \\1/')
                vim.cmd('nohl') -- 关闭高亮
            elseif line:find("%- %[x%]") then
                -- 使用 Vim 的替换命令将 "- [x]" 替换为 "- [ ]"
                vim.cmd('s/- \\[x\\] \\(.*\\)/- [ ] \\1/')
                vim.cmd('nohl') -- 关闭高亮
            else
                -- 如果当前行不包含 "- [ ]" 或 "- [x]"，则执行默认的 `till` 操作
                vim.api.nvim_feedkeys("t", "n", false)
            end
        end, { buffer = true, noremap = true, silent = true }) -- 设置为 buffer 级别，仅在当前文件生效
    end,
})

-- Markdown 文件类型下自动切换输入法(异步的喔)
-- 借助命令行工具im-self进行输入法的切换
local md_china = false
if md_china then
    vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = "markdown",
        callback = function()
            -- 进入插入模式时切换为中文输入法
            vim.api.nvim_create_autocmd("InsertEnter", {
                buffer = 0,
                callback = function()
                    vim.loop.spawn("im-select", { args = { "com.apple.inputmethod.SCIM.Shuangpin" } }, function() end)
                    -- 方法1，通过im-select异步调用
                    -- 显示的关闭了句柄，该命令太短了，无所谓
                    -- 但是速度真的快了很多，啊哈哈哈哈哈哈哈
                    -- local handle
                    -- handle = vim.loop.spawn("im-select", {
                    --     args = { "com.apple.inputmethod.SCIM.Shuangpin" },
                    -- }, function()
                    --     if handle then handle:close() end
                    -- end)
                end,
            })
        end,
    })
end
