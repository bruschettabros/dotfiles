local function start()
    local emoji = {'🉑', '🈚', '🈸', '🈺', '🈷', '🈹', '🈶', '🈯', '💜'}
    return emoji[math.random(#emoji)]
end
local function animal()
    local selection = {'🐶', '🐼', '🐸', '🦊', '🦁', '🐵', '🐮', '🐷', '🐨', '🗿', '🪬'}
    return selection[math.random(#selection)]
end

lvim.transparent_window = true

lvim.builtin.lualine.options = {
  icons_enabled = true,
  theme = 'palenight',
  component_separators = { left = '🧿', right = '🍬'},
  section_separators = { left = '', right = ''},
  disabled_filetypes = {
    statusline = {},
    winbar = {},
  },
  ignore_focus = {},
  always_divide_middle = true,
  globalstatus = false,
  refresh = {
    statusline = 1000,
    tabline = 1000,
    winbar = 1000,
  }
}

  lvim.builtin.lualine.sections = {
    lualine_a = {{start}, 'mode', 'selectioncount', 'searchcount'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', 'filesize' },
    lualine_x = {'fileformat', 'filetype', 'encoding'},
    lualine_y = {'location', 'progress'},
    lualine_z = {"os.date('%a - %d/%m/%y - %H:%M:%S')", {animal} }
  }
  lvim.builtin.lualine.inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
