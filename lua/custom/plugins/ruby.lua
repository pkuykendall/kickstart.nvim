return {
  {
    'tpope/vim-rails',
    config = function()
      -- disable setting ft=eruby.yaml
      vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
        pattern = { '*.yml' },
        callback = function() vim.bo.filetype = 'yaml' end,
      })
    end,
  },
  { 'tpope/vim-rake' },
  { 'vim-ruby/vim-ruby' },

  { 'andymass/vim-matchup' },
  { 'tpope/vim-endwise' },
}
