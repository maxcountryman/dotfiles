return function()
  local nvim_web_devicons = safe_require 'nvim-web-devicons'
  if not nvim_web_devicons then
    return
  end

  nvim_web_devicons.setup()
end
