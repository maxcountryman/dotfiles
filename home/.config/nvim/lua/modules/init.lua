local function conf(name)
  return require(string.format('modules.config.%s', name))
end

local plugins = {
  { -- Fancy notifications
    'rcarriga/nvim-notify',
    config = conf 'notify',
  },
  { -- Colorschemes
    'catppuccin/nvim',
    as = 'catppuccin',
  },
  { -- Treesiter
    'nvim-treesitter/nvim-treesitter',
    config = conf 'nvim-treesitter',
    run = ':TSUpdate',
  },
  { -- Finder
    'nvim-telescope/telescope.nvim',
    config = conf 'telescope',
    requires = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },
  },
  { -- Illuminate
    'RRethy/vim-illuminate',
  },
  { -- Icons
    'kyazdani42/nvim-web-devicons',
    config = conf 'nvim-web-devicons',
  },
  { -- Lsp
    'neovim/nvim-lspconfig',
    config = conf 'lsp',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim', -- Formatter
      'ray-x/lsp_signature.nvim',
      'RRethy/vim-illuminate',
      'simrat39/rust-tools.nvim',
      --'jose-elias-alvarez/typescript.nvim',
      'b0o/schemastore.nvim',
    },
  },
  { -- Autocompletion plugin
    'hrsh7th/nvim-cmp',
    config = conf 'nvim-cmp',
    requires = {
      'onsails/lspkind-nvim', -- Enables icons on completions
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      { -- Snippets
        'L3MON4D3/LuaSnip',
        requires = {
          'saadparwaiz1/cmp_luasnip',
          'rafamadriz/friendly-snippets',
        },
      },
    },
  },
  { -- Rust crates
    'saecki/crates.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup {
        null_ls = {
          enabled = true,
          name = 'crates.nvim',
        },
      }
    end,
  },
  { -- Git related
    'lewis6991/gitsigns.nvim',
    config = conf 'gitsigns',
    requires = { 'nvim-lua/plenary.nvim' },
  },
  { -- Indent guides
    'lukas-reineke/indent-blankline.nvim',
    config = conf 'indent-blankline',
  },
  { -- Statusline
    'feline-nvim/feline.nvim',
    config = conf 'feline',
  },
  { -- Hop
    'phaazon/hop.nvim',
    config = conf 'hop',
  },
  { -- Tmux
    'aserowy/tmux.nvim',
    config = conf 'tmux',
  },
  { -- Highlight current line number
    'yamatsum/nvim-cursorline',
    config = conf 'nvim-cursorline',
  },
  { -- Autosave
    'Pocco81/auto-save.nvim',
    config = conf 'auto-save',
  },
  { -- Tailwind color highlights
    'princejoogie/tailwind-highlight.nvim',
  },
  { -- vimdiff tool.
    'sindrets/diffview.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  },
}

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd 'packadd packer.nvim'
end

local packer = safe_require 'packer'
if packer then
  packer.init {
    compile_path = vim.fn.stdpath 'data' .. '/site/plugin/packer_compiled.lua',
    package_root = vim.fn.stdpath 'data' .. '/site/pack',
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'rounded' }
      end,
    },
  }

  return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    for _, plugin in ipairs(plugins) do
      use(plugin)
    end
  end)
end
