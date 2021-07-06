config.source("style.py")
config.load_autoconfig()

config.bind(",c", "config-edit")
config.bind(",m", "spawn --userscript music-dl")
config.bind(",M", "hint links userscript music-dl")
config.bind(";m", "hint --rapid links userscript music-dl")
config.bind(",r", "spawn --userscript readability-js")
config.bind(",sd", "set-cmd-text -s :session-delete")
config.bind(",sl", "set-cmd-text -s :session-load")
config.bind(",ss", "set-cmd-text -s :session-save")
config.bind(",S", "config-cycle statusbar.show in-mode always")
config.bind(
    ",T",
    "config-cycle tabs.show switching always;; config-cycle tabs.title.format {index:>2} '{index:>2}{audio} {current_title}';; config-cycle tabs.width 40 '20%'",
)
config.bind(",tg", "set-cmd-text -s :tab-give")
config.bind(",tp", "set-cmd-text -s :tab-pin")
config.bind(",ts", "set-cmd-text -s :tab-select")
config.bind(",v", "spawn --userscript mpv-play")
config.bind(",V", "hint links userscript mpv-play")
config.bind(";v", "hint --rapid links userscript mpv-play")
config.bind("zl", "spawn --userscript qute-pass")
config.bind("zul", "spawn --userscript qute-pass --username-only")
config.bind("zpl", "spawn --userscript qute-pass --password-only")

c.auto_save.session = True
c.changelog_after_upgrade = "patch"
c.completion.height = "33%"
c.completion.open_categories = [
    "searchengines",
    "quickmarks",
    "filesystem",
    "history",
]
c.completion.scrollbar.padding = 1
c.completion.scrollbar.width = 7
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
c.keyhint.delay = 0
c.scrolling.bar = "never"
c.scrolling.smooth = True
c.spellcheck.languages = ["en-GB"]
c.statusbar.show = "in-mode"
c.statusbar.widgets = ["keypress", "history", "url", "progress", "scroll", "tabs"]
c.tabs.indicator.width = 0
c.tabs.new_position.unrelated = "next"
c.tabs.position = "left"
c.tabs.last_close = "default-page"
c.tabs.show = "switching"
c.tabs.show_switching_delay = 1500
c.tabs.title.format = "{index:>2}"
c.tabs.title.format_pinned = "{index:>2}"
c.tabs.width = 40
c.url.default_page = "https://duckduckgo.com/"
c.url.open_base_url = True
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "ddg": "https://duckduckgo.com/?q={}",
    "tw": "https://twitch.com/{}",
    "yt": "https://youtube.com/results?search_query={}",
    "wiki": "https://en.wikipedia.org/w/index.php?search={}",
    "steam": "http://store.steampowered.com/search/?term={}",
    "aur": "https://aur.archlinux.org/packages/?O=0&K={}",
    "arch": "https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}",
    "imdb": "http://www.imdb.com/find?ref_=nv_sr_fn&s=all&q={}",
    "dic": "http://www.dictionary.com/browse/{}",
    "ety": "http://www.etymonline.com/index.php?allowed_in_frame=0&search={}",
    "urbn": "http://www.urbandictionary.com/define.php?term={}",
    "ddgi": "https://duckduckgo.com/?q={}&iar=images",
    "qwnt": "https://www.qwant.com/?q={}",
    "sp": "https://www.startpage.com/do/dsearch?query={}",
    "hmbl": "https://www.humblebundle.com/store/search?sort=bestselling&search={}",
}
c.url.start_pages = ["https://duckduckgo.com/"]
c.window.title_format = "{perc}{audio}{private}{current_title}{title_sep}qutebrowser"
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
