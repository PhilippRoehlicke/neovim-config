return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        yaml = { "actionlint" },
      }

      -- Automatically lint on cursor idle in normal mode
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "CursorHold" }, {
        callback = function()
          lint.try_lint()
        end,
      })

      -- Show linting errors using Neovim's diagnostic system
      vim.api.nvim_create_autocmd("User", {
        pattern = "LintResult",
        callback = function()
          vim.diagnostic.set(
            vim.api.nvim_get_current_buf(),
            require("lint").get_linter_by_ft("yaml"),
            require("lint").get_diagnostics()
          )
        end,
      })
    end,
  },
}
