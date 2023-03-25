return function()
  local lspconfig = safe_require 'lspconfig'
  if not lspconfig then
    return
  end

  require('modules.config.lsp.handlers').setup()
  require('modules.config.lsp.handlers').enable_format_on_save()
  require('modules.config.lsp.null-ls').setup()

  local mason_lspconfig = safe_require 'mason-lspconfig'
  if not mason_lspconfig then
    return
  end

  --mason_lspconfig.setup {
  --  ensure_installed = {},
  --}

  mason_lspconfig.setup_handlers {
    function(server_name)
      require('lspconfig')[server_name].setup {
        capabilities = require('modules.config.lsp.handlers').capabilities,
        on_attach = require('modules.config.lsp.handlers').on_attach,
      }
    end,

    ['tailwindcss'] = function()
      require('lspconfig').tailwindcss.setup {
        capabilities = require('modules.config.lsp.handlers').capabilities,
        on_attach = function(client, bufnr)
          require('tailwind-highlight').setup(
            client,
            bufnr,
            { single_column = false, mode = 'background', debounce = 200 }
          )
          require('modules.config.lsp.handlers').on_attach(client, bufnr)
        end,
      }
    end,

    ['rust_analyzer'] = function()
      require('rust-tools').setup {
        tools = {
          inlay_hints = { auto = true },
          hover_actions = {
            auto_focus = true,
          },
          runnables = {
            use_telescope = true,
          },
        },
        server = {
          capabilities = require('modules.config.lsp.handlers').capabilities,
          on_attach = require('modules.config.lsp.handlers').on_attach,
          settings = {
            ['rust-analyzer'] = {
              -- HACK: https://github.com/simrat39/rust-tools.nvim/issues/300
              inlayHints = { locationLinks = false },
              checkOnSave = {
                command = 'clippy',
              },
              cargo = { features = 'all' },
            },
          },
        },
      }
    end,

    ['denols'] = function()
      require('lspconfig').denols.setup {
        capabilities = require('modules.config.lsp.handlers').capabilities,
        on_attach = require('modules.config.lsp.handlers').on_attach,
        root_dir = require('lspconfig').util.root_pattern('deno.json', 'deno.jsonc'),
      }
    end,

    ['tsserver'] = function()
      require('lspconfig').tsserver.setup {
        --disable_commands = false,
        capabilities = require('modules.config.lsp.handlers').capabilities,
        on_attach = require('modules.config.lsp.handlers').on_attach,
        root_dir = require('lspconfig').util.root_pattern 'package.json',
        single_file_support = false,
      }
    end,

    ['lua_ls'] = function()
      require('lspconfig').lua_ls.setup {
        capabilities = require('modules.config.lsp.handlers').capabilities,
        on_attach = require('modules.config.lsp.handlers').on_attach,
        settings = {
          Lua = {
            format = { enable = false }, -- Ensure we use `null-ls` instead, i.e. Stylua.
            diagnostics = {
              globals = { 'vim', 'safe_require' },
            },
          },
        },
      }
    end,

    ['jsonls'] = function()
      require('lspconfig').jsonls.setup {
        capabilities = require('modules.config.lsp.handlers').capabilities,
        on_attach = require('modules.config.lsp.handlers').on_attach,
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      }
    end,
  }

  local mason = safe_require 'mason'
  if not mason then
    return
  end

  mason.setup()
end
