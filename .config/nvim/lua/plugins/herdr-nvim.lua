-- Nvim half of herdr-nvim (the herdr plugin lives in ~/.config/herdr/plugins.txt):
-- comment code like a review and send it to the agent in this herdr workspace.
-- Prefix is <leader>A because <leader>a is the Claude Code extra (<leader>ac, <leader>as clash).
return {
  "ChmaraX/herdr-nvim",
  cond = vim.env.HERDR_TAB_ID ~= nil, -- only inside herdr (panes and the sidebar daemon set it)
  event = "VeryLazy",
  opts = { prefix = "<leader>A" },
  specs = {
    {
      "folke/which-key.nvim",
      optional = true,
      opts = { spec = { { "<leader>A", group = "agent annotations", mode = { "n", "x" } } } },
    },
  },
}
