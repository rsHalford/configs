local packer = require 'packer'

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return packer.startup(function(use)
	use "wbthomason/packer.nvim"

  -- Search
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-fzf-native.nvim',
      },
      wants = {
        'popup.nvim',
        'plenary.nvim',
        'telescope-fzf-native.nvim',
      },
      config = [[require('config.telescope')]],
      cmd = 'Telescope',
      module = 'telescope',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
  }

  -- Undo tree
  use {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
  }

  -- Git
  use {
    {
      'tpope/vim-fugitive',
      -- cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' },
    },
    {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = [[require('config.gitsigns')]],
    }
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Completion and Linting
  use {
    'neovim/nvim-lspconfig',
    config = [[require('config.lsp')]],
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'akinsho/flutter-tools.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = [[require('config.flutter')]],
  }

  use {
    'tami5/lspsaga.nvim',
    config = [[require('config.lspsaga')]],
  }

  -- Highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require('config.treesitter')]],
    run = ':TSUpdate',
  }

  use { 'p00f/nvim-ts-rainbow' }

  use { 'windwp/nvim-ts-autotag' }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-emoji', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    },
    config = [[require('config.cmp')]],
    event = 'InsertEnter *',
  }

  use 'rafamadriz/friendly-snippets'

  -- Debugging
  -- use {
  --   'mfussenegger/nvim-dap',
  --   setup = [[require('config.dap_setup')]],
  --   config = [[require('config.dap')]],
  --   module = 'dap',
  -- }

  -- Highlight colors
  use {
    'norcalli/nvim-colorizer.lua',
    ft = { 'css', 'javascript', 'vim', 'html', 'vue', 'svelte' },
    config = [[require('colorizer').setup {nil, {css = true}}]],
  }

  -- Colour scheme
  use 'gruvbox-community/gruvbox'

  -- Markdown
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = 'markdown',
    -- cmd = 'MarkdownPreview'
  }

  use 'dbeniamine/cheat.sh-vim'

  -- Editing
  use 'psf/black'

  use {
    'numToStr/Comment.nvim',
    config = [[require('config.comment')]],
  }

  use 'tpope/vim-surround'

  use {
    'windwp/nvim-autopairs',
    config = [[require('nvim-autopairs').setup{}]],
  }

  use 'mattn/emmet-vim'
  use 'tpope/vim-repeat'


  use {
    'folke/zen-mode.nvim',
    config = [[require('config.zen-mode')]],
  }

  use {
    'folke/twilight.nvim',
    config = [[require('config.twilight')]],
  }

  -- Prose
  use 'preservim/vim-pencil'
  use 'dbmrq/vim-ditto'
  use 'preservim/vim-litecorrect'
  use 'kana/vim-textobj-user'
  use 'preservim/vim-textobj-quote'
  use 'preservim/vim-textobj-sentence'
  use 'preservim/vim-wordy'

  use {
    'goolord/alpha-nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('config.alpha')]],
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('config.nvim-tree')]],
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
    },
    config = [[require('config.lualine')]],
  }

  use {
    'akinsho/toggleterm.nvim',
    config = [[require('config.toggleterm')]],
  }

end)
