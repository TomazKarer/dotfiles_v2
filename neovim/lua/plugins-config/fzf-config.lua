local api = vim.api
api.nvim_set_keymap('n', '<leader>ff', ':Files<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>fg', ':Rg<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>fb', ':Buffers<CR>', { noremap = true })
