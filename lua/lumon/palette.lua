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
}

--- The accent ramp, ordered deepest (1) to lightest (8).
--- All eight aether accent slots map onto these; see `M.aether` below.
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

--- Palette in the shape aether.nvim expects (v2 key names).
--- Role comments describe what aether uses each slot for, not what the color
--- looks like -- in Lumon they are all the same blue by design.
M.aether = {
  -- Background colors
  bg = M.base.navy,
  bg_dark = M.base.navy, -- flat: sidebars and floats match the editor
  bg_highlight = M.base.steel,

  -- Foreground colors
  -- fg: object properties, builtin types/variables, member access, default text
  fg = M.base.mist,
  -- fg_dark: inactive elements, statusline, secondary text
  fg_dark = M.base.mist, -- flat: no dimmed second tier
  -- comment: line highlight, gutter elements, disabled states
  comment = M.base.steel,

  -- Accent colors
  -- red: errors, diagnostics, tags, deletions, breakpoints
  red = M.ramp[1],
  -- green: comments, strings, success states, git additions
  green = M.ramp[2],
  -- yellow: types, classes, constructors, warnings, numbers, booleans
  yellow = M.ramp[3],
  -- orange: constants, numbers, current line number, git modifications
  orange = M.ramp[4],
  -- blue: functions, keywords, directories, links, info diagnostics
  blue = M.ramp[5],
  -- purple: storage keywords, special keywords, identifiers, namespaces
  purple = M.ramp[6],
  -- magenta: function declarations, exception handling, tags
  magenta = M.ramp[7],
  -- cyan: parameters, regex, preprocessor, hints, properties
  cyan = M.ramp[8],
}

return M
