-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- :Lsp Log (and :LspLog) to open the LSP log, which Neovim 0.12 no longer provides.
-- Any other :Lsp subcommand is passed through to the built-in :lsp (e.g. :Lsp restart)
local function open_lsp_log()
  vim.cmd.tabnew(vim.lsp.log.get_filename())
end

vim.api.nvim_create_user_command("LspLog", open_lsp_log, { desc = "Open LSP log" })
vim.api.nvim_create_user_command("Lsp", function(args)
  if args.fargs[1] and args.fargs[1]:lower() == "log" then
    return open_lsp_log()
  end
  vim.cmd("lsp " .. args.args)
end, {
  nargs = "+",
  desc = "LSP commands (Log, restart, stop, enable, disable)",
  complete = function(arglead, cmdline)
    if #vim.split(cmdline, "%s+") > 2 then
      return vim.fn.getcompletion("lsp " .. cmdline:gsub("^%S+%s+", ""), "cmdline")
    end
    return vim.tbl_filter(function(s)
      return s:lower():find(arglead:lower(), 1, true) == 1
    end, { "Log", "restart", "stop", "enable", "disable" })
  end,
})
