------------------------
-- Plugin management  --
------------------------

local fn = vim.fn

-- bootstrap packer.nvim
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

-- install plugins
return require("packer").startup(function(use)

	use 'wbthomason/packer.nvim'

	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

        use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use {'junegunn/fzf.vim'}

	use {
	  'vimwiki/vimwiki'
	}

	use {
          'kyazdani42/nvim-tree.lua',
          requires = 'kyazdani42/nvim-web-devicons'
        }

	use {
	  'diepm/vim-rest-console'
	}

	use {
	  'neovim/nvim-lspconfig'
	}

	use {
	  'tpope/vim-fugitive'
	}

	use {
          'nvim-treesitter/nvim-treesitter',
          run = ':TSUpdate'
        }

	use {
          'hoob3rt/lualine.nvim',
          requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }

	use {
	  'will133/vim-dirdiff'
	}
end)
