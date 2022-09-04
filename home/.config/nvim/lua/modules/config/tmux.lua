return function()
  local tmux = safe_require 'tmux'
  if not tmux then
    return
  end

  tmux.setup {
    copy_sync = {
      enable = true,
      redirect_to_clipboard = true,
    },
    navigation = {
      enable_default_keybindings = true,
    },
    resize = {
      enable_default_keybindings = true,
    },
  }
end
