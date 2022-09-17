return function()
  local cmp = safe_require 'cmp'
  local luasnip = safe_require 'luasnip'
  local lspkind = safe_require 'lspkind'
  if not cmp or not luasnip or not lspkind then
    return
  end

  vim.opt.completeopt = 'menu,menuone,noselect'

  local select_opts = { behavior = cmp.SelectBehavior.Select }

  local cmp_window = safe_require 'cmp.utils.window'
  if cmp_window then
    cmp_window.info_ = cmp_window.info
    cmp_window.info = function(self)
      local info = self:info_()
      info.scrollable = false
      return info
    end
  end

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered {
        winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None',
      },
      documentation = cmp.config.window.bordered {
        winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None',
      },
    },
    formatting = {
      fields = { 'menu', 'abbr', 'kind' },
      format = lspkind.cmp_format {
        menu = {},
        mode = 'symbol_text', -- show only symbol annotations
        preset = 'codicons', -- https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      },
    },
    experimental = {
      native_menu = false,
      ghost_text = true,
    },
    -- Sources order are actually their priority order
    sources = cmp.config.sources {
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lua' },
      { name = 'luasnip' },
      { name = 'vnsip' },
      { name = 'path' },
      { name = 'crates' },
      { name = 'buffer' },
      { name = 'emoji' },
    },
    mapping = {
      ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
      ['<Down>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),

      ['<C-Space>'] = cmp.mapping.complete {},
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },

      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
  }
end
