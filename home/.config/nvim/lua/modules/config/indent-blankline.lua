return function()
  local indent_blankline = safe_require 'indent_blankline'
  if not indent_blankline then
    return
  end

  indent_blankline.setup {
    space_char_blankline = ' ',
    show_current_context = true,
  }
end
