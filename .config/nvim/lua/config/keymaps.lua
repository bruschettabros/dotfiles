-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Left window
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Down window
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Up window
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Right window

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts) -- Decrease height
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts) -- Increase height
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts) -- Decrease width
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- Increase width

-- Better indenting
keymap.set("v", "<", "<gv", opts) -- Stay in indent mode when indenting left
keymap.set("v", ">", ">gv", opts) -- Stay in indent mode when indenting right

-- Move text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- Move selected text down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- Move selected text up

-- Quick save
keymap.set("n", "<C-s>", "<cmd>w<CR>", opts) -- Save file
keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>a", opts) -- Save file in insert mode

-- Center cursor when scrolling
keymap.set("n", "<C-d>", "<C-d>zz", opts) -- Half page down and center
keymap.set("n", "<C-u>", "<C-u>zz", opts) -- Half page up and center
keymap.set("n", "n", "nzzzv", opts) -- Next search result and center
keymap.set("n", "N", "Nzzzv", opts) -- Previous search result and center

-- Quick splits
keymap.set("n", "<leader>-", ":split<CR>", { desc = "Split horizontal" }) -- Split horizontal
keymap.set("n", "<leader>|", ":vsplit<CR>", { desc = "Split vertical" }) -- Split vertical

-- Terminal mode: no global mappings here. Snacks terminals (incl. Claude Code) already get
-- <Esc><Esc> for normal mode and <C-hjkl> window nav; a global <Esc>/<C-k>/<C-l> would
-- swallow keys that TUIs like Claude Code and lazygit need.

-- Buffer management
keymap.set("n", "<leader>bj", ":BufferLinePick<CR>", { desc = "Jump to buffer" }) -- Jump to buffer
keymap.set("n", "<leader>bf", ":BufferLineTogglePin<CR>", { desc = "Pin buffer" }) -- Pin/unpin buffer
keymap.set("n", "<leader>bx", ":BufferLinePickClose<CR>", { desc = "Pick & close" }) -- Pick buffer to close

-- Quick pairs: removed. mini.pairs already auto-closes brackets/quotes, and the "{{"-style
-- insert mappings made every single {, [, (, ' and " wait for a possible second key.

-- IdeaVim muscle memory (ported from ~/.ideavimrc). Only bindings that don't collide with
-- LazyVim defaults are ported; MIGRATION.md lists where the rest live now.
keymap.set("n", "U", "<C-r>", { desc = "Redo" })
keymap.set("n", "<CR>", function()
  -- only in normal file buffers, so <CR> still works in quickfix, pickers, etc.
  if vim.bo.buftype == "" and vim.bo.modifiable then
    return "a<CR><Esc>k$"
  end
  return "<CR>"
end, { expr = true, desc = "Split line at cursor" })
keymap.set("n", "gn", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab (buffer)" })
keymap.set("n", "gp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev tab (buffer)" })

-- <leader>o: open
keymap.set("n", "<leader>ot", function() Snacks.terminal() end, { desc = "Terminal" })
keymap.set("n", "<leader>oo", "<cmd>Outline<cr>", { desc = "File structure" })
keymap.set("n", "<leader>oi", function()
  vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" }, diagnostics = {} }, apply = true })
end, { desc = "Optimize imports" })
keymap.set("n", "<leader>oe", function()
  local env = LazyVim.root() .. "/.env"
  if not vim.uv.fs_stat(env) then
    return vim.notify("No .env in " .. LazyVim.root(), vim.log.levels.WARN)
  end
  vim.cmd.vsplit(env)
end, { desc = "Project .env" })
keymap.set("n", "<leader>ov", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Neovim config" })

-- find usages / docs / rename / rollback / refactor
keymap.set("n", "<leader>fu", function() Snacks.picker.lsp_references() end, { desc = "Find usages" })
keymap.set("n", "<leader>fd", function() require("neogen").generate() end, { desc = "Doc comment" })
keymap.set("n", "<leader>rn", "<leader>cr", { remap = true, desc = "Rename" })
keymap.set("n", "<leader>rl", function() require("gitsigns").reset_hunk() end, { desc = "Rollback changed lines" })
keymap.set("x", "<leader>em", "<leader>rf", { remap = true, desc = "Extract method" })
keymap.set("x", "<leader>ev", "<leader>rx", { remap = true, desc = "Extract variable" })
keymap.set("n", "<leader>im", vim.lsp.buf.code_action, { desc = "Implement/override (code actions)" })

-- <leader>m: move file / method hierarchy / make
keymap.set("n", "<leader>mf", function() Snacks.rename.rename_file() end, { desc = "Rename file" })
keymap.set("n", "<leader>mh", function() Snacks.picker.lsp_incoming_calls() end, { desc = "Method hierarchy (callers)" })
keymap.set("n", "<leader>m-", ":!make ", { desc = "Run make …" })
keymap.set("n", "<leader>g-", ":!git ", { desc = "Run git …" })

-- debugging / zen
keymap.set("n", "<leader>tb", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
keymap.set("n", "<leader>0", function() require("dap").continue() end, { desc = "Start debugging (Xdebug listen)" })
keymap.set("n", "<leader>tz", function() Snacks.zen() end, { desc = "Zen mode" })
