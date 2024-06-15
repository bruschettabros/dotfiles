local keymap = vim.keymap
local whichKey = lvim.builtin.which_key.mappings

vim.g.mapleader = " "

keymap.set("n", "X", ":q")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set('n', '<leader>n', "<cmd>bn<cr>")
keymap.set('n', '<leader>p', "<cmd>bp<cr>")

whichKey["p"] = {
    name = "Plugins",
    i = { "<cmd>Lazy install<cr>", "Install" },
    s = { "<cmd>Lazy sync<cr>", "Sync" },
    S = { "<cmd>Lazy clear<cr>", "Status" },
    u = { "<cmd>Lazy update<cr>", "Update" },
}
whichKey["t"] = {
    name = "Trouble",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
