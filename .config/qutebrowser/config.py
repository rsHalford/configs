c.tabs.background = True
# c.new_instance_open_target = "window"
# config.bind(",p", "config-cycle -p content.plugins ;; reload")

# config.bind(',rta', 'open {url}top/?sort=top&t=all')
# config.bind(',rtv', 'spawn termite -e "rtv {url}"')
# config.bind(',c', 'spawn -d chromium {url}')

# css = '~/proj/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css'
# config.bind(",n", f'config-cycle content.user_stylesheets {css} ""')

# c.url.searchengines["rfc"] = "https://tools.ietf.org/html/rfc{}"
# c.url.searchengines["pypi"] = "https://pypi.org/project/{}/"
# c.url.searchengines["qtbug"] = "https://bugreports.qt.io/browse/QTBUG-{}"
# c.url.searchengines["qb"] = "https://github.com/The-Compiler/qutebrowser/issues/{}"
# c.url.searchengines["btc"] = "https://www.blockchain.com/btc/address/{}"
# c.url.searchengines["http"] = "https://httpstatuses.com/{}"
# c.url.searchengines["duden"] = "https://www.duden.de/suchen/dudenonline/{}"
# c.url.searchengines["dictcc"] = "https://www.dict.cc/?s={}"
# c.url.searchengines['maps'] = 'https://www.google.com/maps?q=%s'

# c.aliases['ytdl'] = """spawn -v -m bash -c 'cd ~/vid/yt && youtube-dl "$@"' _ {url}"""

# c.fonts.tabs = '8pt monospace'
# c.fonts.statusbar = '8pt monospace'
# c.fonts.web.family.fantasy = 'Arial'

c.search.incremental = False

# c.qt.args = ['ppapi-widevine-path=/usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so']

c.content.javascript.enabled = True
# config.source('perdomain.py')


# config.source("style.py")
config.load_autoconfig()
###############################################################################
###############################################################################


c.auto_save.session = True
c.changelog_after_upgrade = "patch"
c.completion.height = "33%"
c.completion.open_categories = [
    "searchengines",
    "quickmarks",
    "bookmarks",
    "filesystem",
    "history",
]
c.completion.scrollbar.padding = 1
c.completion.scrollbar.width = 5
c.completion.shrink = True
c.completion.timestamp_format = "%H:%M %d-%m-%y"
c.confirm_quit = ["downloads"]
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt",
]
c.content.blocking.method = "both"
c.content.fullscreen.window = True
c.content.headers.accept_language = "en-GB,en-US;q=0.9,en;q=0.8"
c.content.notifications.enabled = False
c.downloads.location.directory = "~/Downloads"
c.downloads.location.suggestion = "both"
c.downloads.position = "bottom"
c.downloads.remove_finished = 180000
c.editor.command = ["st", "-e", "nvim", "{}"]
c.input.insert_mode.auto_load = True
c.keyhint.delay = 0
c.scrolling.bar = "never"
c.spellcheck.languages = ["en-GB"]
# c.statusbar.position = 'bottom'
c.statusbar.show = "in-mode"
c.statusbar.widgets = ["keypress", "history", "url", "progress", "scroll", "tabs"]
c.tabs.indicator.width = 0
c.tabs.new_position.unrelated = "next"
c.tabs.position = "left"

## Default filesystem autocomplete suggestions for :open. The elements of
## this list show up in the completion window under the Filesystem
## category when the command line contains `:open` but no argument.
## Type: List of String
# c.completion.favorite_paths = []

# Watching Videos
config.bind(",v", "spawn --userscript mpv-play")
config.bind(",V", "hint links userscript mpv-play")
config.bind(";v", "hint --rapid links userscript mpv-play")

# Downloading Music
config.bind(",m", "spawn --userscript music-dl")
config.bind(",M", "hint links userscript music-dl")
config.bind(";m", "hint --rapid links userscript music-dl")

config.bind(",ce", "config-edit")

# Login Auto-Fill
config.bind("zl", "spawn --userscript qute-pass")
config.bind("zul", "spawn --userscript qute-pass --username-only")
config.bind("zpl", "spawn --userscript qute-pass --password-only")
# config.bind("zol", "spawn --userscript qute-pass --otp-only")

## List of user stylesheet filenames to use.
## Type: List of File, or File
# c.content.user_stylesheets = []

## Name of the session to save by default. If this is set to null, the
## session which was last loaded is saved.
## Type: SessionName
# c.session.default_name = None

## How to behave when the last tab is closed. If the
## `tabs.tabs_are_windows` setting is set, this is ignored and the
## behavior is always identical to the `close` value.
## Type: String
## Valid values:
##   - ignore: Don't do anything.
##   - blank: Load a blank page.
##   - startpage: Load the start page.
##   - default-page: Load the default page.
##   - close: Close the window.
# c.tabs.last_close = 'ignore'

## Maximum width (in pixels) of tabs (-1 for no maximum). This setting
## only applies when tabs are horizontal. This setting does not apply to
## pinned tabs, unless `tabs.pinned.shrink` is False. This setting may
## not apply properly if max_width is smaller than the minimum size of
## tab contents, or smaller than tabs.min_width.
## Type: Int
# c.tabs.max_width = -1

## Minimum width (in pixels) of tabs (-1 for the default minimum size
## behavior). This setting only applies when tabs are horizontal. This
## setting does not apply to pinned tabs, unless `tabs.pinned.shrink` is
## False.
## Type: Int
# c.tabs.min_width = -1


c.tabs.select_on_remove = "last-used"
c.tabs.show = "switching"
# c.tabs.show_switching_delay = 800
# c.tabs.title.alignment = 'left'
c.tabs.title.format = "{index}{audio}{current_title}"
# c.tabs.title.format = "{index:<02}"
c.tabs.title.format_pinned = "{index:>02}"
# c.tabs.width = '15%'
c.url.default_page = "https://start.duckduckgo.com/"
# c.url.open_base_url = False
# c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}'}
# c.url.searchengines["DEFAULT"] = 'https://duckduckgo.com/?q={}'
# c.url.start_pages = ['https://start.duckduckgo.com']
c.window.title_format = "{perc}{audio}{current_title}{title_sep}qutebrowser"
c.zoom.levels = [
    "25%",
    "33%",
    "50%",
    "67%",
    "75%",
    "90%",
    "100%",
    "110%",
    "125%",
    "133%",
    "150%",
    "175%",
    "200%",
    "250%",
    "300%",
    "400%",
    "500%",
]
