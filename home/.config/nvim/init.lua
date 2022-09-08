vim.g.mapleader = ' '

require 'utils'
require 'modules'
require 'options'
require 'keymaps'

require('modules.config.colors').catppuccin()
vim.cmd 'hi! link DiagnosticHint String'
vim.cmd(
  'hi DiagnosticUnderlineError gui=undercurl guisp='
    .. require('modules.config.colors').get_color('DiagnosticError', 'fg')
)
vim.cmd(
  'hi DiagnosticUnderlineWarn  gui=undercurl guisp='
    .. require('modules.config.colors').get_color('DiagnosticWarn', 'fg')
)
vim.cmd(
  'hi DiagnosticUnderlineInfo  gui=undercurl guisp='
    .. require('modules.config.colors').get_color('DiagnosticInfo', 'fg')
)
vim.cmd(
  'hi DiagnosticUnderlineHint  gui=undercurl guisp='
    .. require('modules.config.colors').get_color('DiagnosticHint', 'fg')
)
