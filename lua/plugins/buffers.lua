return {
  -- Switch between the currently used files very fast
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      ---@diagnostic disable-next-line: missing-parameter
      harpoon.setup()

      -- basic telescope configuration

      vim.keymap.set("n", "<C-h>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set("n", "<leader>ha", function()
        harpoon:list():add()
      end, { desc = "[a]dd buffer to harpoon" })
      vim.keymap.set("n", "<leader>hd", function()
        harpoon:list():clear()
      end, { desc = "[d]elete all harpoon entries" })

      vim.keymap.set("n", "<C-a>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<C-s>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<C-y>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<C-x>", function()
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
    "folke/persistence.nvim",
    event = "BufReadPre", -- Load early
    opts = {
      dir = vim.fn.stdpath("state") .. "/sessions/",
      options = { "buffers", "curdir", "tabpages", "winsize" },
      pre_save = function()
        -- Clean up hidden buffers before saving
        for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
          if not vim.fn.bufwinnr(buf.bufnr) or vim.fn.bufwinnr(buf.bufnr) == -1 then
            vim.api.nvim_buf_delete(buf.bufnr, { force = true })
          end
        end
      end,
    },
    keys = {
      {
        "<leader>qr",
        function()
          require("persistence").load()
        end,
        desc = "Restore Session",
      },
    },
  },
}
