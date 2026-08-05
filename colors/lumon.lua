-- The `lumon` colorscheme: an aether.nvim variant.
--
-- Registering it here (rather than injecting colors into the plugin spec) makes
-- lumon a first-class colorscheme: `:colorscheme lumon` works, `vim.g.colors_name`
-- reports "lumon", and it shows up in `:colorscheme <Tab>` and the Telescope picker.
--
-- Colors live in `lua/lumon/palette.lua`.

local palette = require 'lumon.palette'

require('aether').load {
  name = 'lumon',
  colors = palette.aether,

  -- aether v3 draws comments from `muted`, the same slot as line numbers and
  -- window borders. Lumon wants comments legible against the navy field while
  -- the gutter stays recessed, so comment text is pulled back onto the ramp.
  -- Only `fg` is replaced, leaving each group's italic/bold styling intact.
  on_highlights = function(hl, _)
    for _, group in ipairs {
      'Comment',
      'SpecialComment',
      'CommentNormal',
      'CommentBold',
      'CommentItalic',
      'gitcommitComment',
    } do
      if type(hl[group]) == 'table' then hl[group] = vim.tbl_extend('force', hl[group], { fg = palette.ramp[2] }) end
    end
  end,
}
