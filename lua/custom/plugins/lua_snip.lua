-- return {
--   'benfowler/telescope-luasnip.nvim',
--   module = 'telescope._extensions.luasnip', -- if you wish to lazy-load
-- }
return {
  'benfowler/telescope-luasnip.nvim',
  event = 'VimEnter',
  dependencies = {
    { 'L3MON4D3/LuaSnip' },
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    require('telescope').load_extension 'luasnip'
    vim.keymap.set('n', '<leader>csp', ':Telescope luasnip theme=dropdown<CR>', { desc = '[C]ode [S]nippet [P]review' })
  end,
}
