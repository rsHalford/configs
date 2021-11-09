local alpha = require 'alpha'

local header = {
  type = 'text',
  val = {
    '              ██████  ██████',
    '              ██░░██  ██░░██',
    '              ██░░██  ██░░██',
    '              ██░░██  ██░░██',
    '████████████████░░██████░░██',
    '██░░░░░░░░░░░░░░░░░░░░░░░░██',
    '██░░██████░░████░░██████░░██',
    '██░░██  ██░░░░░░░░██  ██░░██',
    '██░░██  ████████░░██  ██░░██',
    '██░░██  ██░░░░░░░░██  ██░░██',
    '██████  ████████████  ██████',
  },
  opts = {
    position = 'center',
    hl = 'Type',
  },
}

local handle = io.popen 'fd -d 2 . $HOME"/.local/share/nvim/site/pack/packer" | grep pack | wc -l | tr -d "\n" '
local plugins = handle:read '*a'
handle:close()

local thingy = io.popen 'echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"'
local date = thingy:read '*a'
thingy:close()
plugins = plugins:gsub('^%s*(.-)%s*$', '%1')

local heading = {
  type = 'text',
  val = '┌─   Today is ' .. date .. ' ─┐',
  opts = {
    position = 'center',
    hl = 'Identifier',
  },
}

local plugin_count = {
  type = 'text',
  val = '└─   ' .. plugins .. ' plugins in total ─┘',
  opts = {
    position = 'center',
    hl = 'Identifier',
  },
}

local function button(sc, txt, keybind)
  local sc_ = sc:gsub('%s', ''):gsub('SPC', '<leader>')

  local opts = {
    position = 'center',
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 24,
    align_shortcut = 'right',
    hl = 'Todo',
    hl_shortcut = 'Special',
  }
  if keybind then
    opts.keymap = { 'n', sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = 'button',
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, 'normal', false)
    end,
    opts = opts,
  }
end

local buttons = {
  type = 'group',
  val = {
    button('f', '  Explore', [[<cmd>lua require('telescope.builtin').file_browser({hidden=true})<CR>]]),
    button('n', '  New file', [[<cmd>ene <BAR> startinsert <CR>]]),
    button('r', '  Recent', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]]),
    button('s', '  Settings', [[<cmd>e $MYVIMRC<CR>]]),
    button('q', '  Quit', [[<cmd>qa<CR>]]),
  },
  opts = {
    spacing = 1,
  },
}

local fortune = require 'alpha.fortune'()
-- fortune = fortune:gsub("^%s+", ""):gsub("%s+$", "")
local footer = {
  type = 'text',
  val = fortune,
  opts = {
    position = 'center',
    hl = 'Comment',
    hl_shortcut = 'Comment',
  },
}

local section = {
  header = header,
  buttons = buttons,
  plugin_count = plugin_count,
  heading = heading,
  footer = footer,
}

local opts = {
  layout = {
    { type = 'padding', val = 8 },
    section.header,
    { type = 'padding', val = 4 },
    section.heading,
    section.plugin_count,
    { type = 'padding', val = 3 },
    section.buttons,
    { type = 'padding', val = 2 },
    section.footer,
  },
  opts = {
    margin = 0,
  },
}

alpha.setup(opts)
