return {

  -- Auto import and format on save
  {
    'ray-x/go.nvim',
    config = function()
      local format_sync_grp = vim.api.nvim_create_augroup('GoImport', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          require('go.format').goimport()
        end,
        group = format_sync_grp,
      })
      require('go').setup()
    end,
    dependencies = {
      'ray-x/guihua.lua',
    },
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
