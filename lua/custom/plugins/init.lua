-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Search all chezmoi files
vim.keymap.set('n', '<leader>cz', function() require('chezmoi.pick').telescope() end)

-- Search only neovim config files
-- The default chezmoi CLI args for the telescope picker are used as an example
vim.keymap.set(
  'n',
  '<leader>fc',
  function()
    require('chezmoi.pick').telescope(targets == vim.fn.stdpath 'config', args == {
      '--path-style',
      'absolute',
      '--include',
      'files',
      '--exclude',
      'externals',
    })
  end
)

return {}
