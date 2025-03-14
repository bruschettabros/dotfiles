local wk = require("which-key")

-- Custom WhichKey mappings
wk.register({
  ["<leader>"] = {
    -- Copilot section
    c = {
      name = "✨ Copilot",
      p = { "<cmd>Copilot panel<CR>", "Open Panel" },
      e = { "<cmd>Copilot enable<CR>", "Enable" },
      d = { "<cmd>Copilot disable<CR>", "Disable" },
    },
    -- Buffer section
    b = {
      name = "󰈙 Buffers",
      j = { ":BufferLinePick<CR>", "Jump" },
      f = { ":BufferLineTogglePin<CR>", "Pin/Unpin" },
      x = { ":BufferLinePickClose<CR>", "Pick & Close" },
    },
    -- Enhanced navigation
    h = { "^", "Start of line" },
    l = { "$", "End of line" },
    j = { "mzJ`z", "Join lines (preserve cursor)" },
    -- Quick splits
    ["-"] = { ":split<CR>", "󰤸 Split horizontal" },
    ["|"] = { ":vsplit<CR>", "󰤻 Split vertical" },
  },
})

-- Document existing keymaps for better discoverability
wk.register({
  -- Insert mode mappings for Copilot
  ["<C-l>"] = { name = "Accept suggestion", mode = "i" },
  ["<C-j>"] = { name = "Next suggestion", mode = "i" },
  ["<C-k>"] = { name = "Previous suggestion", mode = "i" },

  -- Window navigation
  ["<C-h>"] = { name = "󰌋 Left window", mode = { "n", "t" } },
  ["<C-j>"] = { name = "󰌋 Bottom window", mode = { "n", "t" } },
  ["<C-k>"] = { name = "󰌋 Top window", mode = { "n", "t" } },
  ["<C-l>"] = { name = "󰌋 Right window", mode = { "n", "t" } },

  -- Window resizing
  ["<C-Up>"] = { name = "󰁝 Decrease height", mode = "n" },
  ["<C-Down>"] = { name = "󰁅 Increase height", mode = "n" },
  ["<C-Left>"] = { name = "󰁍 Decrease width", mode = "n" },
  ["<C-Right>"] = { name = "󰁋 Increase width", mode = "n" },

  -- Quick save
  ["<C-s>"] = { name = "󰆓 Save file", mode = { "n", "i" } },

  -- Visual mode text movement
  ["J"] = { name = "󰁝 Move down", mode = "v" },
  ["K"] = { name = "󰁜 Move up", mode = "v" },

  -- Quick pairs in insert mode
  ["{{"] = { name = "󰄱 Curly braces", mode = "i" },
  ["[["] = { name = "󰄱 Square brackets", mode = "i" },
  ["(("] = { name = "󰄱 Parentheses", mode = "i" },
  ["''"] = { name = "󰄱 Single quotes", mode = "i" },
  ['""'] = { name = "󰄱 Double quotes", mode = "i" },
}) 