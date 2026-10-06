-- Neovim equivalents of the IdeaVim extensions in ~/ideavim/plugins.vim.
-- Already covered by LazyVim, so nothing to add:
--   easymotion/sneak -> flash (s / S)      commentary -> gc / gcc
--   argtextobj/functiontextobj/textobj-indent/textobj-entire -> mini.ai (a / f / i / g)
--   highlightedyank -> built in            peekaboo -> which-key on " and @
--   NERDTree -> <leader>e                  which-key -> which-key
return {
  -- surround: ys{motion}{char}, cs{old}{new}, ds{char}, visual S{char}
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    opts = {},
  },
  -- let visual S be surround (as in IdeaVim) instead of Flash Treesitter; S in normal mode is unchanged
  {
    "folke/flash.nvim",
    optional = true,
    keys = { { "S", mode = "x", false } },
  },

  -- multiple-cursors: <C-n> select word / add next match, <M-Down>/<M-Up> add cursor vertically
  {
    "mg979/vim-visual-multi",
    branch = "master",
    keys = { { "<C-n>", mode = { "n", "x" }, desc = "Multi-cursor" } },
    init = function()
      -- keep <C-Up>/<C-Down> for window resizing
      vim.g.VM_maps = { ["Add Cursor Down"] = "<M-Down>", ["Add Cursor Up"] = "<M-Up>" }
    end,
  },

  -- exchange: cx{motion} twice to swap, cxx for lines, X in visual, cxc to cancel
  {
    "tommcdo/vim-exchange",
    keys = { { "cx", desc = "Exchange" }, { "X", mode = "x", desc = "Exchange" } },
  },

  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>o", group = "open" },
        { "<leader>m", group = "file/hierarchy/make" },
        { "<leader>t", group = "debug/toggle" },
        { "<leader>i", group = "implement" },
      },
    },
  },
}
