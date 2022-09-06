return function()
  local telescope = safe_require 'telescope'
  if not telescope then
    return
  end

  local actions = require 'telescope.actions'
  telescope.setup {
    defaults = {
      prompt_prefix = '❯ ',
      selection_caret = '❯ ',
      layout_config = { horizontal = { preview_width = 0.5 } },
      file_ignore_patterns = { 'node_modules/.*', '%.env' },
      mappings = {
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
        },
        n = { ['<C-c>'] = actions.close },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  }
  telescope.load_extension 'fzf'
end
