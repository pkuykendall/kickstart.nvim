--
--
--                                                 @@@@@@@@@@@@@@
--                                 @@@@@@@@@@@@@@@@@@          @@@@@@@@@@@@@@@
--                            @@@@@@@@@@@@@      @@              @@      @@@@@@@@@@@@@
--                       @@@@@     @@@@        @@                  @@        @@@@     @@@@@
--                   @@@        @@@          @@                      @@         @@@        @@@
--                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--            @@@@          @@             @@                          @@            @@         @@@@
--          @@@           @@              @@                            @@             @@          @@@
--        @@@            @@               @@                            @@              @@           @@@
--       @@                                                                                            @@
--      @@                                                                                              @@
--     @@            @@           @@         @@  @@           @@   @@@@@@@@@@@@  @@@        @@           @@
--    @@             @@           @@         @@  @@@@       @@@@  @@@@@@  @@@@@@ @@@@@      @@            @@
--    @              @@           @@         @@  @@@@@     @@@@@  @@@@@    @@@@@ @@  @@@    @@             @
--    @              @@           @@         @@  @@  @@@  @@@ @@  @@@@      @@@@ @@    @@@@ @@             @
--    @              @@           @@         @@  @@   @@@@@@  @@  @@@@@    @@@@@ @@      @@@@@             @
--    @              @@@@@@@@@@@@ \@@@@@@@@@@@/  @@    @@@@   @@   @@@@@@@@@@@@  @@        %@@             @
--    @@                                                                                                  @@
--     @@                                                                                                @@
--      @@              @@                @@                            @@                @@            @@
--        @@             @@               @@                            @@               @@           @@
--          @@            @@               @@                          @@               @@          @@
--            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--               @@@         @@@            @@                        @@            @@         @@@
--                  @@@         @@           @@                      @@          @@@        @@@
--                     @@@@@      @@@          @@                  @@         @@@      @@@@@
--                          @@@@@@    @@@        @@              @@        @@@   @@@@@@
--                               @@@@@@@@@@@@@@    @@          @@    @@@@@@@@@@@@@
--                                            @@@@@@@@@@@@@@@@@@@@@@@@
--
--                                          ＵＮＩＴＥＤ ＩＮ 𝙎𝙀𝙑𝙀𝙍𝘼𝙉𝘾𝙀

-- Colorschemes.
--
-- `lumon` is the active theme. It is an aether.nvim variant defined in this
-- config rather than in the plugin:
--   * `lua/lumon/palette.lua`  -- the colors
--   * `colors/lumon.lua`       -- the variant that applies them
--
-- To switch themes for the current session, use `:colorscheme <name>` or
-- `:Telescope colorscheme` (which previews as you move). Both work on the
-- lazy-loaded themes below: Telescope lists unloaded plugins' `colors/` files,
-- and lazy.nvim loads the owning plugin on `ColorSchemePre`.
--
-- To change the default, edit the single `vim.cmd.colorscheme` call below.

return {
  -- The active theme, so it loads during startup and before everything that
  -- reads highlight groups on setup. See `:help lazy.nvim-🔌-plugin-spec`.
  {
    'bjarneo/aether.nvim',
    branch = 'v3',
    name = 'aether',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
    },
    config = function(_, opts)
      require('aether').setup(opts)
      vim.cmd.colorscheme 'tokyonight-night'
      -- Hot reload registers itself from aether.setup/load as of v3; no call needed.
    end,
  },

  -- Alternatives, installed but inert until selected.
  {
    'folke/tokyonight.nvim',
    lazy = true,
    opts = {
      styles = {
        comments = { italic = false },
      },
    },
  },
  { 'Mofiqul/dracula.nvim', lazy = true },
}
