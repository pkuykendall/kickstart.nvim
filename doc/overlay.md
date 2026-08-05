# Machine-local overlay

This config keeps a clean, portable core. Anything specific to one machine —
extra plugins, private plugin sources, filetype tooling — lives in a separate
**overlay** that is layered in at startup only when present.

## How it loads

`init.lua` builds its plugin spec into a local `plugins` table and then, just
before calling `require('lazy').setup(...)`, tries to pull in an overlay:

```lua
pcall(function()
  vim.list_extend(plugins, require 'overlay')
end)
```

- On a fresh clone there is no `overlay` module, so `require` fails and `pcall`
  swallows it. The core config loads unchanged.
- When an overlay is deployed, it returns a list of
  [lazy.nvim](https://lazy.folke.io) plugin specs that get appended to the core
  spec. It can also drop `ftplugin/`, `after/`, or other runtime files, since
  the overlay directory is on the `runtimepath`.

The overlay path (`lua/overlay/`) is git-ignored here, so machine-specific
content never lands in this repository.

## Deploying an overlay

Keep the overlay in its own repository and symlink it into place:

```sh
git clone <your-overlay-repo> ~/.config/nvim-overlay
ln -s ~/.config/nvim-overlay ~/.config/nvim/lua/overlay
```

`lua/overlay/init.lua` should return a table of plugin specs, for example:

```lua
-- lua/overlay/init.lua
return {
  { 'some/plugin', ft = 'java', opts = {} },
  -- ...more machine-specific specs...
}
```

Any `ftplugin/<lang>.lua` inside the overlay is sourced automatically for that
filetype, so language-specific setup can live entirely in the overlay too.

To remove it, delete the symlink — the core config keeps working.
