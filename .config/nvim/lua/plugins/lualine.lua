return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    -- Enhanced color palette with gradients
    local colors = {
      bg = "#1a1b26",
      fg = "#c0caf5",
      blue = "#7aa2f7",
      cyan = "#7dcfff",
      green = "#9ece6a",
      purple = "#9d7cd8",
      red = "#f7768e",
      yellow = "#e0af68",
      orange = "#ff9e64",
      magenta = "#bb9af7",
      dark = "#16161e",
      -- Gradient colors
      blue_light = "#89b4f7",
      green_light = "#a6d672",
      purple_light = "#a385dc",
      red_light = "#f88a9e",
      yellow_light = "#e4b775",
    }

    -- Mode icon and name mapping
    local mode_map = {
      ["NORMAL"] = { icon = "󰆧", color = colors.blue },
      ["INSERT"] = { icon = "󰏫", color = colors.green },
      ["VISUAL"] = { icon = "󰈈", color = colors.purple },
      ["V-LINE"] = { icon = "󰈈", color = colors.purple },
      ["V-BLOCK"] = { icon = "󰈈", color = colors.purple },
      ["REPLACE"] = { icon = "󰛔", color = colors.red },
      ["COMMAND"] = { icon = "󰘳", color = colors.yellow },
    }

    -- Animated separator component
    local function animated_separator()
      local frames = {
        "▒░▓▒░",
        "░▒░▓▒",
        "▓▒░▒░",
        "▒▓▒░▒",
        "▒░▓▒v",
        "░▒░vi",
        "▓▒vim",
        "▒vim▒",
        "▒░▓▒░",
        "░▒󰌽▓▒",
        "▓▒░▒░",
        "▒▓󰊢░▒",
      }

      local ms = vim.loop.hrtime() / 1000000
      local tick = math.random(1, 20) * 10

      local frame = frames[math.floor(ms / tick) % #frames + 1]
      return frame
    end

    local function get_lsp_clients()
      local clients = vim.lsp.get_clients({ bufnr = 0 }) or {}
      if #clients == 0 then
        return "󰒎 No LSP"
      end

      local client_names = {}
      for _, client in pairs(clients) do
        table.insert(client_names, client.name)
      end
      return string.format("󰒍 LSP: %s", table.concat(client_names, ", "))
    end

    -- Enhanced file size with dynamic icons
    local function get_file_size()
      local file = vim.fn.expand("%:p")
      if string.len(file) == 0 then
        return ""
      end
      local size = vim.fn.getfsize(file)
      if size <= 0 then
        return ""
      end

      local suffixes = { "B", "KB", "MB", "GB" }
      local icons = { "󰈔", "󰈔", "󰈔", "󰈔" }
      local i = 1
      while size > 1024 and i < #suffixes do
        size = size / 1024
        i = i + 1
      end
      return string.format("%s %.1f%s", icons[i], size, suffixes[i])
    end

    -- Get current time with dynamic icon
    local function get_time()
      local time = os.date("*t")
      local icons = {
        [0] = "󱑊", -- 12am - 6am
        [6] = "󰖨", -- 6am - 12pm
        [12] = "󰖚", -- 12pm - 6pm
        [18] = "󰖛", -- 6pm - 12am
      }
      local hour = time.hour
      local icon = icons[math.floor(hour / 6) * 6]
      return string.format("%s %02d:%02d:%02d", icon, time.hour, time.min, time.sec)
    end

    local function recording_macro()
      local reg = vim.fn.reg_recording()
      if reg ~= "" then
        return "󰑋 @" .. reg
      end
      return ""
    end

    local custom_theme = {
      normal = {
        a = { fg = colors.dark, bg = colors.blue, gui = "bold" },
        b = { fg = colors.blue_light, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.dark, bg = colors.green, gui = "bold" },
        b = { fg = colors.green_light, bg = colors.bg },
      },
      visual = {
        a = { fg = colors.dark, bg = colors.purple, gui = "bold" },
        b = { fg = colors.purple_light, bg = colors.bg },
      },
      replace = {
        a = { fg = colors.dark, bg = colors.red, gui = "bold" },
        b = { fg = colors.red_light, bg = colors.bg },
      },
      command = {
        a = { fg = colors.dark, bg = colors.yellow, gui = "bold" },
        b = { fg = colors.yellow_light, bg = colors.bg },
      },
      inactive = {
        a = { fg = colors.dark, bg = colors.cyan, gui = "bold" },
        b = { fg = colors.cyan, bg = colors.bg },
      },
    }

    return {
      options = {
        icons_enabled = true,
        theme = custom_theme,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              local map = mode_map[str] or { icon = "󰆧", color = colors.blue }
              return map.icon .. " " .. str
            end,
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
          },
          animated_separator,
        },
        lualine_b = {
          {
            "branch",
            icon = "󰊢",
            color = { fg = colors.magenta, gui = "bold" },
            padding = { left = 1, right = 1 },
          },
          {
            "diff",
            symbols = {
              added = "+",
              modified = "~",
              removed = "-",
            },
            colored = true,
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.orange },
              removed = { fg = colors.red },
            },
            padding = { left = 1, right = 1 },
          },
          {
            "diagnostics",
            symbols = {
              error = "x ",
              warn = "! ",
              info = " ",
              hint = "? ",
            },
            diagnostics_color = {
              error = { fg = colors.red },
              warn = { fg = colors.yellow },
              info = { fg = colors.cyan },
              hint = { fg = colors.green },
            },
            colored = true,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = {
              modified = "●",
              readonly = "",
              unnamed = "[No Name]",
            },
            color = { fg = colors.cyan, gui = "bold" },
            padding = { left = 1, right = 1 },
          },
          {
            get_lsp_clients,
            padding = { left = 1, right = 1 },
            color = { fg = colors.green, gui = "bold" },
          },
        },
        lualine_x = {
          recording_macro,
          {
            get_file_size,
            padding = { left = 1, right = 1 },
            color = { fg = colors.yellow, gui = "bold" },
          },
          {
            "encoding",
            fmt = string.upper,
            icon = "󰈡",
            color = { fg = colors.magenta },
            padding = { left = 1, right = 1 },
          },
          {
            "fileformat",
            symbols = {
              unix = "󰌽 Unix",
              dos = "󰨡 Win",
              mac = " Mac",
            },
            color = { fg = colors.orange },
            padding = { left = 1, right = 1 },
          },
          {
            "filetype",
            colored = true,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_y = {
          {
            "progress",
            icon = "󰜎",
            color = { fg = colors.purple, gui = "bold" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_z = {
          {
            get_time,
            separator = { left = "", right = "" },
            color = function()
              local mode = vim.fn.mode()
              if mode == "n" then
                return { fg = colors.dark, bg = colors.blue, gui = "bold" }
              elseif mode == "i" then
                return { fg = colors.dark, bg = colors.green, gui = "bold" }
              elseif mode:find("[vV]") then
                return { fg = colors.dark, bg = colors.purple, gui = "bold" }
              elseif mode == "R" then
                return { fg = colors.dark, bg = colors.red, gui = "bold" }
              elseif mode == "c" then
                return { fg = colors.dark, bg = colors.yellow, gui = "bold" }
              else
                return { fg = colors.dark, bg = colors.blue, gui = "bold" }
              end
            end,
            padding = { left = 1, right = 1 },
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            color = { fg = colors.cyan },
          },
        },
        lualine_x = {
          {
            "location",
            color = { fg = colors.blue },
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "fugitive", "nvim-tree", "lazy", "mason" },
    }
  end,
}
