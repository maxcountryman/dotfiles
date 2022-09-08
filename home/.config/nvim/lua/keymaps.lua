local map = vim.keymap.set

-- remap the key used to leave insert mode
map('i', 'jk', '', {})

-- remap for vertical splits
map('n', 'vv', '<cmd>vsplit<cr>')

-- remap for hop
map(
  '',
  'f',
  "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
  {}
)
map(
  '',
  'F',
  "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
  {}
)
map(
  '',
  't',
  "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
  {}
)
map(
  '',
  'T',
  "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
  {}
)

-- remap for telescope
--local is_git_dir = os.execute 'git rev-parse --is-inside-work-tree >> /dev/null 2>&1'
--if is_git_dir == 0 then
--  map('n', '<C-f>', '<cmd>lua require("telescope.builtin").git_files()<cr>')
--else
map('n', '<C-f>', '<cmd>lua require("telescope.builtin").find_files()<cr>')
map('n', '<C-g>', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
--end

map('n', '/', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>')
map('i', '<C-f>', '<esc><cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>')

-- remap for LSP
--map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
--map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
--map('n', 'gr', '<cmd>LspTrouble lsp_references<CR>', { noremap = true, silent = true })
--map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
--map('n', '<C-space>', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
--map('v', '<C-space>', '<cmd>RustHoverRange<CR>')
--
--map('n', 'ge', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
--map('n', 'gE', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
--map('n', '<silent><leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
--map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
--map('n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
--map('v', '<Leader>a', '<cmd>lua vim.lsp.buf.range_code_action()<CR>')
