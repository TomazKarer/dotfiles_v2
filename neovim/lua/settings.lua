------------------------
-- Neovim API aliases --
------------------------

local g   = vim.g -- global variables
local api = vim.api -- global variables
local wo  = vim.wo  -- windows-local options

------------------------
-- General settings   --
------------------------

g.mapleader = ',' -- leader remapped as ,
api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true }) -- escape remapped as jk
-- wo.number = true

