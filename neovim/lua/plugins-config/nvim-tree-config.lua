local api = vim.api
local g = vim.g

api.nvim_set_keymap('n', '<leader>nn', ':NvimTreeToggle<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>nf', ':NvimTreeFindFile<CR>', { noremap = true })
g.nvim_tree_show_icons = { 
	git = 1, 
	folders = 1, 
	files = 1, 
	folder_arrows = 1 
}
--api.nvim_exec([[ autocmd BufWinEnter * NvimTreeFindFile ]], false)
require'nvim-tree'.setup()
