-- .NET project tooling: run/build/test/debug, NuGet, user-secrets, `dotnet new`.
-- Requires the EasyDotnet global tool: `dotnet tool install -g EasyDotnet`.
-- Run :Dotnet for the full command list.
return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim", "mfussenegger/nvim-dap" },
  ft = { "cs", "fsharp", "vb", "xml" },
  cmd = "Dotnet",
  opts = {
    picker = "snacks",
    -- OmniSharp is the C# LSP (lazyvim lang.dotnet extra); don't start Roslyn alongside it
    lsp = { enabled = false },
  },
  keys = {
    { "<leader>N", "", desc = "+.NET" },
    { "<leader>Nr", "<cmd>Dotnet run<cr>", desc = "Run project" },
    { "<leader>Nw", "<cmd>Dotnet watch<cr>", desc = "Watch (hot reload)" },
    { "<leader>Nb", "<cmd>Dotnet build quickfix<cr>", desc = "Build (errors to quickfix)" },
    { "<leader>Nd", "<cmd>Dotnet debug<cr>", desc = "Debug project" },
    { "<leader>Nt", "<cmd>Dotnet testrunner<cr>", desc = "Test runner" },
    { "<leader>Na", "<cmd>Dotnet add package<cr>", desc = "Add NuGet package" },
    { "<leader>Nx", "<cmd>Dotnet remove package<cr>", desc = "Remove NuGet package" },
    { "<leader>No", "<cmd>Dotnet outdated<cr>", desc = "Outdated packages" },
    { "<leader>Nn", "<cmd>Dotnet new<cr>", desc = "New project/item" },
    { "<leader>Ns", "<cmd>Dotnet secrets<cr>", desc = "User secrets" },
    { "<leader>Nc", "<cmd>Dotnet clean<cr>", desc = "Clean" },
    { "<leader>NT", "<cmd>Dotnet terminal toggle<cr>", desc = "Toggle .NET terminal" },
    { "<leader>N.", "<cmd>Dotnet<cr>", desc = "All .NET commands" },
  },
}
