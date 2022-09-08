local M = {}

M.setup = function()
  local null_ls = safe_require 'null-ls'
  if not null_ls then
    return
  end

  local format = null_ls.builtins.formatting

  null_ls.setup {
    sources = {
      format.taplo,
      format.prettierd,
      format.stylua,
      format.rustfmt.with {
        extra_args = function(params)
          local cargo_toml = params.root .. '/' .. 'Cargo.toml'
          local fd = vim.loop.fs_open(cargo_toml, 'r', 438)
          if not fd then
            return
          end
          local stat = vim.loop.fs_fstat(fd)
          local data = vim.loop.fs_read(fd, stat.size, 0)
          vim.loop.fs_close(fd)
          for _, line in ipairs(vim.split(data, '\n')) do
            local edition = line:match [[^edition%s*=%s*%"(%d+)%"]]
            -- regex maybe wrong.
            if edition then
              return { '--edition=' .. edition }
            end
          end
        end,
      },
    },
  }
end

return M
