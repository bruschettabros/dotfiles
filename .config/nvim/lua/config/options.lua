-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.syntax = "on"
vim.opt.wrap = true
vim.opt.clipboard = "unnamedplus"
vim.opt.smartindent = true
vim.opt.autoread = true
vim.opt.scrolloff = 10 -- as in .ideavimrc

-- prettier (formatting.prettier extra) only where the project has a prettier config,
-- so auto-save doesn't reformat files in repos that don't use it
vim.g.lazyvim_prettier_needs_config = true

-- .NET SDK lives in ~/.dotnet (not on the shell PATH); needed by omnisharp
local dotnet_root = vim.fn.expand("~/.dotnet")
if vim.uv.fs_stat(dotnet_root) then
  vim.env.DOTNET_ROOT = dotnet_root
  vim.env.PATH = dotnet_root .. ":" .. dotnet_root .. "/tools:" .. vim.env.PATH
end

-- PHP: intelephense for hover/completion/diagnostics (understands Laravel magic far better
-- than phpactor). phpactor still runs alongside for code actions + rename (see plugins/php.lua)
vim.g.lazyvim_php_lsp = "intelephense"
