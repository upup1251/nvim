local keymap = vim.keymap
--设置leader键为space
vim.g.mapleader = " "
keymap.set('i', 'jk', "<Esc>")

--size:
keymap.set('n', '<Up>', ':resize +1<cr>')
keymap.set('n', '<Down>', ':resize -1<cr>')
keymap.set('n', '<Right>', ':vertical resize +1<cr>')
keymap.set('n', '<Left>', ':vertical resize -1<cr>')


--切换“/”和“？”的前后搜索方向，把“/”留给flash
vim.api.nvim_set_keymap('n', '/', '?', { noremap = true })
vim.api.nvim_set_keymap('n', '?', '/', { noremap = true })
