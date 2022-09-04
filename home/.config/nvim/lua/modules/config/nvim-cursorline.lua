return function()
  local nvim_cursorline = safe_require 'nvim-cursorline'
  if not nvim_cursorline then
    return
  end

  nvim_cursorline.setup {
    cursorline = {
      enable = true,
    },
  }
end
