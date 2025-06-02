return {
  {
    "stevearc/oil.nvim",
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = function()
      require("oil").setup({
        view_options = {
          show_hidden = true,
        },
      })
    end,
  },
}
