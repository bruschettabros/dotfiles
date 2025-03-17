return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    enabled = true,
    -- message_template = " <summary> • <date> • <author> • <<sha>>",
    message_template = "<author> • <date> • (<summary>) ",
    date_format = "%r",
    virtual_text_column = 1,
  },
}
