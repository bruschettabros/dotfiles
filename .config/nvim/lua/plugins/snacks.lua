return {
  "folke/snacks.nvim",
  opts = {
    notifier = { enabled = true },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          exclude = { "node_modules", ".git", ".idea" },
        },
        -- <leader>ff / <leader>fF: include dotfiles and gitignored files like .env, but skip
        -- dependency/build dirs. "/" anchors to the root so e.g. public/vendor still shows.
        files = {
          hidden = true,
          ignored = true,
          exclude = { "node_modules", ".git", ".idea", "/vendor", "/storage", ".phpunit.cache", "bin", "obj" },
        },
      },
    },
  },
}
