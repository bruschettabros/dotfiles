-- K: use LSP hover only when an attached server supports it (e.g. not copilot-only
-- buffers like Makefiles), otherwise fall back to Vim's built-in K (keywordprg)
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          {
            "K",
            function()
              if #vim.lsp.get_clients({ bufnr = 0, method = "textDocument/hover" }) > 0 then
                return vim.lsp.buf.hover()
              end
              local ok, err = pcall(vim.cmd.normal, { "K", bang = true })
              if not ok then
                vim.notify(err, vim.log.levels.WARN)
              end
            end,
            desc = "Hover",
          },
        },
      },
    },
  },
}
