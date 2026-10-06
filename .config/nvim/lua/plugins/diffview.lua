-- JetBrains-style side-by-side diffs, file history and 3-way merge conflict resolution
return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diff view (changes / conflicts)" },
    { "<leader>gV", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
    { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (diff view)" },
    { "<leader>gH", ":DiffviewFileHistory<cr>", mode = "x", desc = "Selection history" },
  },
  opts = {},
}
