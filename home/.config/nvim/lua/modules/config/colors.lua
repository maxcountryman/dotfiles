local M = {}

function M.get_color(hlgroup, attr)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(hlgroup)), attr, 'gui')
  -- return vim.api.nvim_get_hl_by_name(hlgroup, true)[attr]
end

function M.catppuccin()
  local catppuccin = safe_require 'catppuccin'
  if not catppuccin then
    return
  end

  catppuccin.setup {
    term_colors = true,
    compile = {
      enabled = true,
      path = vim.fn.stdpath 'cache' .. '/catppuccin',
    },
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = {},
        hints = {},
        warnings = {},
        information = {},
      },
      underlines = {
        errors = { 'undercurl' },
        hints = { 'undercurl' },
        warnings = { 'undercurl' },
        information = { 'undercurl' },
      },
    },
    cmp = true,
    gitsigns = true,
    telescope = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    notify = true,
  }

  vim.cmd 'colorscheme catppuccin'
end

return M
