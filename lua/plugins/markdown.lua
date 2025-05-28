return {
  {
    "OXY2DEV/markview.nvim",
    dependencies = {
      "saghen/blink.cmp",
    },
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
}
