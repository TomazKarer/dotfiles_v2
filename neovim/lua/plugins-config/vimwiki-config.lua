local api = vim.api
vim.g.vimwiki_list = {{path = '/home/tomazk/development/home/personal_wiki', syntax = 'markdown', ext = '.md'}}
api.nvim_set_keymap('n', '<leader>wn', '<cmd> VimwikiNextLink', { noremap = true })
--nmap <Leader>wn <Plug>VimwikiNextLink

-- VimWiki hack: when opening new diary file, use template
-- moved to init.vim
-- au BufNewFile ~/zapiski/vimwiki_md/diary/*.md : 0r !~/.vim/bin/generate-vimwiki-diary-template '%'
