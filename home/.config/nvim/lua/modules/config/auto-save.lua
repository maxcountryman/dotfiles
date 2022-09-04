return function()
  local auto_save = safe_require 'auto-save'
  if not auto_save then
    return
  end

  auto_save.setup {}
end
