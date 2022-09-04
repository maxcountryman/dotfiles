return function()
  local ctp_feline = safe_require 'catppuccin.groups.integrations.feline'
  local feline = safe_require 'feline'

  if not ctp_feline or not feline then
    return
  end

  ctp_feline.setup {}

  feline.setup {
    components = ctp_feline.get(),
  }
end
