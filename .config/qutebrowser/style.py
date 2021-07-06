# Colors

bg0_hard = "#1d2021"
bg0_soft = "#32302f"
bg0_normal = "#282828"

bg0 = bg0_normal
bg1 = "#3c3836"
bg2 = "#504945"
bg3 = "#665c54"
bg4 = "#7c6f64"

fg0 = "#fbf1c7"
fg1 = "#ebdbb2"
fg2 = "#d5c4a1"
fg3 = "#bdae93"
fg4 = "#a89984"

bright_red = "#fb4934"
bright_green = "#b8bb26"
bright_yellow = "#fabd2f"
bright_blue = "#83a598"
bright_purple = "#d3869b"
bright_aqua = "#8ec07c"
bright_gray = "#928374"
bright_orange = "#fe8019"

dark_red = "#cc241d"
dark_green = "#98971a"
dark_yellow = "#d79921"
dark_blue = "#458588"
dark_purple = "#b16286"
dark_aqua = "#689d6a"
dark_gray = "#a89984"
dark_orange = "#d65d0e"


##############################################################################
##############################################################################


# Completion

c.colors.completion.category.bg = bg0
c.colors.completion.category.border.bottom = c.colors.completion.category.bg
c.colors.completion.category.border.top = c.colors.completion.category.bg
c.colors.completion.category.fg = bright_yellow
c.colors.completion.even.bg = bg0_hard
c.colors.completion.fg = [fg1, bright_blue, bright_yellow]
c.colors.completion.item.selected.bg = bg1
c.colors.completion.item.selected.border.bottom = c.colors.completion.item.selected.bg
c.colors.completion.item.selected.border.top = c.colors.completion.item.selected.bg
c.colors.completion.item.selected.fg = fg1
c.colors.completion.item.selected.match.fg = c.colors.completion.match.fg
c.colors.completion.match.fg = dark_red
c.colors.completion.odd.bg = c.colors.completion.even.bg
c.colors.completion.scrollbar.bg = c.colors.completion.category.bg
c.colors.completion.scrollbar.fg = fg4


# Context Menu

c.colors.contextmenu.disabled.bg = c.colors.contextmenu.menu.bg
c.colors.contextmenu.disabled.fg = bg4
c.colors.contextmenu.menu.bg = bg0_soft
c.colors.contextmenu.menu.fg = fg1
c.colors.contextmenu.selected.bg = bg2
c.colors.contextmenu.selected.fg = fg0


# Downloads

c.colors.downloads.bar.bg = bg0_hard
c.colors.downloads.error.bg = dark_red
c.colors.downloads.error.fg = bg0_hard
c.colors.downloads.start.bg = dark_yellow
c.colors.downloads.start.fg = bg0_hard
c.colors.downloads.stop.bg = dark_green
c.colors.downloads.stop.fg = bg0_hard
c.colors.downloads.system.bg = "hsv"
c.colors.downloads.system.fg = "hsv"


# Hints

c.colors.hints.bg = bright_yellow
c.colors.hints.fg = bg0
c.colors.hints.match.fg = dark_red
c.hints.border = "2px solid #d79921"
c.hints.padding = {"top": 0, "bottom": 1, "left": 3, "right": 3}
c.hints.radius = 1


# Key Hint

c.colors.keyhint.bg = bg0_hard
c.colors.keyhint.fg = fg1
c.colors.keyhint.suffix.fg = bright_yellow
c.keyhint.radius = 1


# Messages

c.colors.messages.error.bg = dark_red
c.colors.messages.error.border = dark_red
c.colors.messages.error.fg = fg0
c.colors.messages.info.bg = bg0_hard
c.colors.messages.info.border = bg0_hard
c.colors.messages.info.fg = fg1
c.colors.messages.warning.bg = dark_orange
c.colors.messages.warning.border = dark_yellow
c.colors.messages.warning.fg = fg1


# Prompts

c.colors.prompts.bg = bg0_soft
c.colors.prompts.border = "2px solid #282828"
c.colors.prompts.fg = fg1
c.colors.prompts.selected.bg = bg0_hard
c.colors.prompts.selected.fg = fg0
c.prompt.radius = 2


# Statusbar

c.colors.statusbar.caret.bg = dark_orange
c.colors.statusbar.caret.fg = c.colors.statusbar.normal.bg
c.colors.statusbar.caret.selection.bg = c.colors.statusbar.caret.bg
c.colors.statusbar.caret.selection.fg = c.colors.statusbar.normal.bg
c.colors.statusbar.command.bg = bg0_hard
c.colors.statusbar.command.fg = bright_green
c.colors.statusbar.command.private.bg = c.colors.statusbar.command.bg
c.colors.statusbar.command.private.fg = c.colors.statusbar.command.fg
c.colors.statusbar.insert.bg = bright_blue
c.colors.statusbar.insert.fg = c.colors.statusbar.normal.bg
c.colors.statusbar.normal.bg = bg0_hard
c.colors.statusbar.normal.fg = fg1
c.colors.statusbar.passthrough.bg = bright_purple
c.colors.statusbar.passthrough.fg = c.colors.statusbar.normal.bg
c.colors.statusbar.private.bg = c.colors.statusbar.normal.fg
c.colors.statusbar.private.fg = c.colors.statusbar.normal.bg
c.colors.statusbar.progress.bg = fg1
c.colors.statusbar.url.error.fg = dark_red
c.colors.statusbar.url.fg = fg1
c.colors.statusbar.url.hover.fg = bright_blue
c.colors.statusbar.url.success.http.fg = fg2
c.colors.statusbar.url.success.https.fg = fg0
c.colors.statusbar.url.warn.fg = dark_yellow
c.statusbar.padding = {"top": 1, "bottom": 1, "left": 0, "right": 1}


# Tabs

c.colors.tabs.bar.bg = bg0_hard
c.colors.tabs.even.bg = bg0_hard
c.colors.tabs.even.fg = fg1
c.colors.tabs.odd.bg = c.colors.tabs.even.bg
c.colors.tabs.odd.fg = c.colors.tabs.even.fg
c.colors.tabs.pinned.even.bg = dark_green
c.colors.tabs.pinned.even.fg = bg0
c.colors.tabs.pinned.odd.bg = c.colors.tabs.pinned.even.bg
c.colors.tabs.pinned.odd.fg = c.colors.tabs.pinned.even.fg
c.colors.tabs.pinned.selected.even.bg = bright_green
c.colors.tabs.pinned.selected.even.fg = c.colors.tabs.pinned.even.fg
c.colors.tabs.pinned.selected.odd.bg = c.colors.tabs.pinned.selected.even.bg
c.colors.tabs.pinned.selected.odd.fg = c.colors.tabs.pinned.even.fg
c.colors.tabs.selected.even.bg = bg1
c.colors.tabs.selected.even.fg = fg1
c.colors.tabs.selected.odd.bg = c.colors.tabs.selected.even.bg
c.colors.tabs.selected.odd.fg = c.colors.tabs.selected.even.fg
c.tabs.padding = {"top": 1, "bottom": 1, "left": 0, "right": 0}


# Webpage

c.colors.webpage.bg = bg0
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = "never"
c.colors.webpage.preferred_color_scheme = "dark"


# Fonts

c.fonts.contextmenu = "Noto Sans"
c.fonts.default_family = ["JetBrains Mono"]
c.fonts.default_size = "14px"
c.fonts.web.family.sans_serif = "Noto Sans"
c.fonts.web.family.serif = "Noto Serif"
