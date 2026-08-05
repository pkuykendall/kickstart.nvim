--- Lumon palette.
---
--- The single source of truth for the `lumon` colorscheme. Inspired by the
--- Severance title sequence: a cold navy field, one desaturated cyan-blue
--- ramp, and nothing else. Every syntax accent is drawn from `ramp`, so the
--- theme reads as deliberately monochrome -- errors, warnings and git signs
--- are intentionally the same hue family rather than red/yellow/green.
---
--- Consumed by `colors/lumon.lua`, which hands `M.aether` to aether.nvim.

local M = {}

--- Structural colors: the field everything else sits on.
M.base = {
  navy = '#1b2d40', -- editor background
  steel = '#355066', -- cursorline, gutter, comments
  mist = '#c7d2de', -- default text
  haze = '#4b6b83', -- visual selection
}

--- The accent ramp, ordered deepest (1) to lightest (8).
--- Every aether accent slot maps onto one of these; see `M.aether` below.
--- Every step clears WCAG AA contrast against `base.navy`.
---
--- ramp[7] carries no role under aether v3, which folded `magenta` into
--- `purple`. It is kept because it belongs to the ramp and stays reachable
--- from `on_highlights` in `colors/lumon.lua`.
M.ramp = {
  '#6e9fca', -- 1
  '#79abd2', -- 2
  '#86b6da', -- 3
  '#8fb9dc', -- 4
  '#92c7e7', -- 5
  '#9fcfe9', -- 6
  '#b3d7ec', -- 7
  '#b5deef', -- 8
}

--- Palette in the shape aether.nvim expects (v3 key names).
--- Role comments describe what aether uses each slot for, not what the color
--- looks like -- in Lumon they are all the same blue by design.
---
--- v3 removed v2's propagation layer: nothing is derived from `bg` or `muted`
--- anymore, so every slot is spelled out here even where it repeats a value.
M.aether = {
  -- Backgrounds. Flat by design: sidebars, floats and the editor share one field.
  bg = M.base.navy,
  dark_bg = M.base.navy, -- sidebars, statusline, floats
  darker_bg = M.base.navy, -- darkest background
  lighter_bg = M.base.steel, -- cursorline, telescope selection, highlights
  background = M.base.navy, -- terminal alias

  -- Foregrounds. Also flat: one text color, no dimmed or brightened tier.
  fg = M.base.mist, -- default text
  dark_fg = M.base.mist, -- secondary text, statusline, conceal
  light_fg = M.base.mist,
  bright_fg = M.base.mist,
  muted = M.base.steel, -- comments, line numbers, borders, disabled states
  foreground = M.base.mist, -- terminal alias

  -- Accents, deepest to lightest along the ramp.
  -- red: errors, diagnostics, deletions, breakpoints
  red = M.ramp[1],
  -- green: strings, success states, git additions
  green = M.ramp[2],
  -- yellow: types, classes, constructors, warnings
  yellow = M.ramp[3],
  -- orange: constants, numbers, current line number, git modifications
  orange = M.ramp[4],
  -- blue: functions, keywords, directories, links, info diagnostics
  blue = M.ramp[5],
  -- purple: storage keywords, special keywords, namespaces, tags
  purple = M.ramp[6],
  -- cyan: parameters, regex, preprocessor, hints, properties
  cyan = M.ramp[8],
  -- brown: escape sequences
  brown = M.ramp[1],

  -- Bright variants: aether uses these for accent-colored *text*, expecting the
  -- base accents to be too dim to read on `bg`. That does not apply here -- every
  -- ramp step already clears WCAG AA against navy (5.00:1 at the deepest step) --
  -- so each bright variant is pinned to its base rather than shifted lighter,
  -- keeping accent roles distinct instead of collapsing them into neighbours.
  bright_red = M.ramp[1],
  bright_green = M.ramp[2],
  bright_yellow = M.ramp[3],
  bright_blue = M.ramp[5],
  bright_purple = M.ramp[6],
  bright_cyan = M.ramp[8],

  -- Signature color, surfaced to external consumers (the aether CLI, docs).
  accent = M.ramp[5],
  cursor = M.base.mist,

  -- Selection. `haze` reproduces the visual-selection tint lumon had under
  -- aether v2, which derived it by blending; v3 takes it as a literal.
  selection = M.base.haze,
  selection_background = M.base.haze,
  selection_foreground = M.base.mist,
}

return M
