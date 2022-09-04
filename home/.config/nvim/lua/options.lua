local opt = vim.opt

-- [[ Context ]]
--opt.colorcolumn = '99' -- str:  Show col for max line length
opt.number = true -- bool: Show line numbers
opt.relativenumber = true -- bool: Show relative line numbers
opt.scrolloff = 4 -- int:  Min num lines of context
opt.signcolumn = 'yes' -- str:  Show the sign column
opt.wrap = false

-- [[ Filetypes ]]
opt.encoding = 'utf8' -- str:  String encoding to use
opt.fileencoding = 'utf8' -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = 'ON' -- str:  Allow syntax highlighting
opt.termguicolors = true -- bool: If term supports ui color then enable

-- [[ Search ]]
opt.ignorecase = true -- bool: Ignore case in search patterns
opt.smartcase = true -- bool: Override ignorecase if search contains capitals
opt.incsearch = true -- bool: Use incremental search
opt.hlsearch = false -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true -- bool: Use spaces instead of tabs
opt.shiftwidth = 4 -- num:  Size of an indent
opt.softtabstop = 4 -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4 -- num:  Number of spaces tabs count for
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true

-- [[ Splits ]]
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one

-- [[ Backups ]]
opt.backup = true
opt.writebackup = true
opt.swapfile = true

opt.list = true
opt.listchars:append 'space:⋅'
opt.listchars:append 'eol:↴'

opt.updatetime = 300
opt.timeoutlen = 500

opt.autochdir = true

opt.mouse = 'a'

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
opt.pumblend = 10 -- Popup menu transparency
opt.pumheight = 8 -- Popup menu height

opt.shortmess = vim.opt.shortmess + { c = true }