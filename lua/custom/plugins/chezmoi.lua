-- Search all chezmoi files
vim.keymap.set('n', '<leader>cz', function() require('chezmoi.pick').telescope() end)

-- -- Search only neovim config files
-- -- The default chezmoi CLI args for the telescope picker are used as an example
-- vim.keymap.set(
--   'n',
--   '<leader>fc',
--   function()
--     require('chezmoi.pick').telescope(targets == vim.fn.stdpath 'config', args == {
--       '--path-style',
--       'absolute',
--       '--include',
--       'files',
--       '--exclude',
--       'externals',
--     })
--   end
-- )

-- Automatically Running `chezmoi apply` In Specific Directories
--  e.g. ~/.local/share/chezmoi/*
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { os.getenv 'HOME' .. '/.local/share/chezmoi/*' },
  callback = function(ev)
    local bufnr = ev.buf
    local edit_watch = function() require('chezmoi.commands.__edit').watch(bufnr) end
    vim.schedule(edit_watch)
  end,
})

return {
  {
    'xvzc/chezmoi.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('chezmoi').setup {
        -- your configurations
        events = {
          on_open = {
            notification = {
              enable = true,
              msg = 'Opened a chezmoi-managed file',
              opts = {},
            },
          },
          on_watch = {
            notification = {
              enable = true,
              msg = 'This file will be automatically applied',
              opts = {},
            },
          },
          on_apply = {
            notification = {
              enable = true,
              msg = 'Successfully applied',
              opts = {},
            },
          },
        },
      }
    end,
  },
}
