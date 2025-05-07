return {

  -- Switch between the currently used files very fast
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon.setup()

      -- basic telescope configuration

      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "<leader>ad", function()
        harpoon:list():remove()
      end)
      vim.keymap.set("n", "<leader>af", function()
        harpoon:list():clear()
      end)

      vim.keymap.set("n", "<C-a>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<C-s>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<C-S-A>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<C-S-S>", function()
        harpoon:list():select(4)
      end)
      --
      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-P>", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "<C-S-N>", function()
        harpoon:list():next()
      end)
    end,
  },
  {
    "rmagatti/auto-session",
    opts = {
      log_level = "error",
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/", "/" },
    },
  },
}
