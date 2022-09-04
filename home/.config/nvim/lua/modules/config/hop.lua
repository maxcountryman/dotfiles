return function()
  local hop = safe_require 'hop'
  if not hop then
    return
  end

  hop.setup { keys = 'etovxqpdygfblzhckisura' }
end
