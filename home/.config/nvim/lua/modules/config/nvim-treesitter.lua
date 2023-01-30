return function()
  -- Is this required? It likely doesn't belong here if so.
  vim.filetype.add { extension = { wgsl = 'wgsl' } }

  local treesitter = safe_require 'nvim-treesitter.configs'
  if not treesitter then
    return
  end

  treesitter.setup {
    ensure_installed = {
      'astro',
      'bash',
      'fish',
      'hcl',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'lua',
      'markdown',
      'markdown_inline',
      'rust',
      'todotxt',
      'toml',
      'tsx',
      'typescript',
      'wgsl',
      'yaml',
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      -- disable = { 'json' }, -- list of language that will be disabled
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gnn',
        node_incremental = 'grn',
        scope_incremental = 'grc',
        node_decremental = 'grm',
      },
    },
    indent = { enable = true },
    autopairs = { enable = true },
    autotag = { enable = true },
  }
end
