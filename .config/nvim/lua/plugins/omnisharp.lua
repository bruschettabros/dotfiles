-- OmniSharp ignores the LSP root and uses its process cwd as the workspace, so when
-- nvim is started outside the project (e.g. a sibling dir) it can't match open files
-- to the project and hover/references return nothing. Start it in the project root
-- and pass the root explicitly with -s.
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      omnisharp = {
        cmd = function(dispatchers, config)
          local root = config.root_dir or vim.fn.getcwd()
          return vim.lsp.rpc.start({
            vim.fn.exepath("OmniSharp") ~= "" and "OmniSharp" or "omnisharp",
            "-z",
            "--hostPID",
            tostring(vim.fn.getpid()),
            "-s",
            root,
            "DotNet:enablePackageRestore=false",
            "--encoding",
            "utf-8",
            "--languageserver",
          }, dispatchers, { cwd = root })
        end,
      },
    },
  },
}
