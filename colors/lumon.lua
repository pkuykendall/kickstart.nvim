-- The `lumon` colorscheme: an aether.nvim variant.
--
-- Registering it here (rather than injecting colors into the plugin spec) makes
-- lumon a first-class colorscheme: `:colorscheme lumon` works, `vim.g.colors_name`
-- reports "lumon", and it shows up in `:colorscheme <Tab>` and the Telescope picker.
--
-- Colors live in `lua/lumon/palette.lua`.

require('aether').load {
  name = 'lumon',
  colors = require('lumon.palette').aether,
}
