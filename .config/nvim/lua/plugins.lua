local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

  --  Lsp
  use 'neovim/nvim-lspconfig'
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
  use 'tami5/lspsaga.nvim'

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      { 'hrsh7th/cmp-buffer', after= 'nvim-cmp' },
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-emoji', after= 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after= 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after= 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after= 'nvim-cmp' },
    },
    config = [[require('config.cmp')]],
    event = 'InsertEnter *',
  }

  -- Snippets
  use 'rafamadriz/friendly-snippets'

  -- Navigation
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  use 'simrat39/symbols-outline.nvim'

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'szw/vim-maximizer'
  use 'dbeniamine/cheat.sh-vim'

  -- Editing
  use 'psf/black'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'mattn/emmet-vim'
  use 'mbbill/undotree'
  use 'tpope/vim-repeat'

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'

  -- Prose
  use 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  use 'preservim/vim-pencil'
  use 'folke/zen-mode.nvim'
  use 'folke/twilight.nvim'
  use 'dbmrq/vim-ditto'
  use 'preservim/vim-litecorrect'
  use 'kana/vim-textobj-user'
  use 'preservim/vim-textobj-quote'
  use 'preservim/vim-textobj-sentence'
  use 'preservim/vim-wordy'

  -- UI
  use 'gruvbox-community/gruvbox'
  use 'goolord/alpha-nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  use 'p00f/nvim-ts-rainbow'
  use 'norcalli/nvim-colorizer.lua'
  use 'kyazdani42/nvim-web-devicons'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
