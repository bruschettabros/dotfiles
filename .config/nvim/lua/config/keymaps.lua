-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Copilot
keymap.set("i", "<C-l>", "<M-l>", { desc = "Copilot accept suggestion", remap = true })  -- Easier to reach than Alt-l
keymap.set("i", "<C-j>", "<M-]>", { desc = "Copilot next suggestion", remap = true })    -- Easier to reach than Alt-]
keymap.set("i", "<C-k>", "<M-[>", { desc = "Copilot prev suggestion", remap = true })    -- Easier to reach than Alt-[
keymap.set("n", "<leader>cp", "<cmd>Copilot panel<CR>", { desc = "Copilot panel" })      -- Quick access to panel
keymap.set("n", "<leader>ce", "<cmd>Copilot enable<CR>", { desc = "Copilot enable" })    -- Toggle Copilot on
keymap.set("n", "<leader>cd", "<cmd>Copilot disable<CR>", { desc = "Copilot disable" })  -- Toggle Copilot off

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)                                     -- Left window
keymap.set("n", "<C-j>", "<C-w>j", opts)                                     -- Down window
keymap.set("n", "<C-k>", "<C-w>k", opts)                                     -- Up window
keymap.set("n", "<C-l>", "<C-w>l", opts)                                     -- Right window

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)                           -- Decrease height
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)                         -- Increase height
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)                -- Decrease width
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)               -- Increase width

-- Better indenting
keymap.set("v", "<", "<gv", opts)                                           -- Stay in indent mode when indenting left
keymap.set("v", ">", ">gv", opts)                                           -- Stay in indent mode when indenting right

-- Move text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)                             -- Move selected text down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)                             -- Move selected text up

-- Quick save
keymap.set("n", "<C-s>", "<cmd>w<CR>", opts)                               -- Save file
keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>a", opts)                         -- Save file in insert mode

-- Center cursor when scrolling
keymap.set("n", "<C-d>", "<C-d>zz", opts)                                  -- Half page down and center
keymap.set("n", "<C-u>", "<C-u>zz", opts)                                  -- Half page up and center
keymap.set("n", "n", "nzzzv", opts)                                        -- Next search result and center
keymap.set("n", "N", "Nzzzv", opts)                                        -- Previous search result and center

-- Enhanced navigation
keymap.set("n", "<leader>j", "mzJ`z", opts)                                -- Join lines and keep cursor position
keymap.set("n", "<leader>h", "^", opts)                                    -- Go to start of line (first non-blank)
keymap.set("n", "<leader>l", "$", opts)                                    -- Go to end of line

-- Quick splits
keymap.set("n", "<leader>-", ":split<CR>", { desc = "Split horizontal" })  -- Split horizontal
keymap.set("n", "<leader>|", ":vsplit<CR>", { desc = "Split vertical" })   -- Split vertical

-- Terminal mode improvements
keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)                             -- Exit terminal mode
keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)                       -- Navigate left from terminal
keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)                       -- Navigate down from terminal
keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)                       -- Navigate up from terminal
keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)                       -- Navigate right from terminal

-- Buffer management
keymap.set("n", "<leader>bj", ":BufferLinePick<CR>", { desc = "Jump to buffer" })        -- Jump to buffer
keymap.set("n", "<leader>bf", ":BufferLineTogglePin<CR>", { desc = "Pin buffer" })       -- Pin/unpin buffer
keymap.set("n", "<leader>bx", ":BufferLinePickClose<CR>", { desc = "Pick & close" })     -- Pick buffer to close

-- Quick pairs
keymap.set("i", "{{", "{}<Left>", opts)                                    -- Quick curly braces
keymap.set("i", "[[", "[]<Left>", opts)                                    -- Quick square brackets
keymap.set("i", "((", "()<Left>", opts)                                    -- Quick parentheses
keymap.set("i", "''", "''<Left>", opts)                                    -- Quick single quotes
keymap.set("i", '""', '""<Left>', opts)                                    -- Quick double quotes
