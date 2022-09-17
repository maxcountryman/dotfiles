local opt = vim.opt

-- [[ Context ]]
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
opt.shiftwidth = 4 -- num:  Size of an indent
opt.softtabstop = 4 -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4 -- num:  Number of spaces tabs count for
opt.expandtab = true -- bool: Use spaces instead of tabs
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true

-- [[ Splits ]]
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one

-- [[ Recovery ]]
opt.undofile = true
local cache_prefix = vim.fn.stdpath 'cache'
opt.undodir = cache_prefix .. '.undo/'
opt.backupdir = cache_prefix .. '.backup/'
opt.directory = cache_prefix .. '.swp/'

opt.list = true
opt.listchars:append 'space:⋅'
opt.listchars:append 'eol:↴'

opt.updatetime = 300
opt.timeoutlen = 500
opt.mouse = 'a'
opt.showmode = false
opt.clipboard = 'unnamedplus'
opt.laststatus = 3

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noselect: Do not select, force to select one from the menu
-- noinsert: Do not insert text until a selection is made
opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
opt.pumblend = 10 -- Popup menu transparency
opt.pumheight = 8 -- Popup menu height

-- Shortmess
opt.shortmess = opt.shortmess
  + {
    A = true, -- don't give the "ATTENTION" message when an existing swap file is found.
    I = true, -- don't give the intro message when starting Vim |:intro|.
    W = true, -- don't give "written" or "[w]" when writing a file
    c = true, -- don't give |ins-completion-menu| messages
    m = true, -- use "[+]" instead of "[Modified]"
  }

-- Format options
opt.formatoptions = opt.formatoptions
  + {
    c = false,
    o = false, -- O and o, don't continue comments
    r = true, -- Pressing Enter will continue comments
  }
