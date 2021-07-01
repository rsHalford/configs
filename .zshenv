export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export PATH="$HOME/.local/bin":"$HOME/.local/bin/scripts":"$HOME/.local/bin/statusbar":"/opt/flutter/bin":"$XDG_DATA_HOME/go/bin"

export ADB_KEYS_PATH="$ANDROID_PREFS_ROOT"
export ADB_VENDOR_KEY="$ANDROID_PREFS_ROOT"
export ANDROID_AVD_HOME="$XDG_DATA_HOME/android/"
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME/android/emulator"
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME/android"
export ANDROID_SDK_HOME="$XDG_DATA_HOME/android/"
export CHROME_EXECUTABLE="/usr/bin/brave"
export GOPATH="$XDG_DATA_HOME/go"
export GNUPGHOME="$HOME/.gnupg"
export HISTFILE="$XDG_CACHE_HOME/history"
export LESSHISTFILE="-"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/history/node_repl_history"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"
export VIMPERATOR_INIT="$XDG_CONFIG_HOME/vimperator/vimperatorrc"
export VIMPERATOR_RUNTIME="$XDG_CONFIG_HOME/vimperator"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export JAVA_FONTS="/usr/share/fonts/TTF"
export _JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
export _JAVA_AWT_WM_NONREPARENTING=1

export BROWSER="qutebrowser"
export EDITOR="nvim"
export IMAGE="sxiv"
export READER="zathura"
export TERMINAL="st"
export VIDEO="mpv"
export VISUAL="nvim"

#bat changes
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export SUBS_FILE=$XDG_CONFIG_HOME/subs/subs.txt
