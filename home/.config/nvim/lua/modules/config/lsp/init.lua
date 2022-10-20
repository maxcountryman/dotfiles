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

  mason_lspconfig.setup {
    ensure_installed = {
      'astro',
      'eslint',
      'rust_analyzer',
      'sumneko_lua',
      'tailwindcss',
      'taplo',
      'tsserver',
    },
  }

  mason_lspconfig.setup_handlers {
    function(server_name)
      require('lspconfig')[server_name].setup {
        capabilities = require('modules.config.lsp.handlers').capabilities,
        on_attach = require('modules.config.lsp.handlers').on_attach,
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
              checkOnSave = {
                command = 'clippy',
              },
            },
          },
        },
      }
    end,

    ['tsserver'] = function()
      require('typescript').setup {
        disable_commands = false,
        server = {
          capabilities = require('modules.config.lsp.handlers').capabilities,
          on_attach = require('modules.config.lsp.handlers').on_attach,
        },
      }
    end,

    ['sumneko_lua'] = function()
      require('lspconfig').sumneko_lua.setup {
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
