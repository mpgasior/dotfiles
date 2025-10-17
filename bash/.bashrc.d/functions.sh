# Functions

# nnn (cd on quit)
# https://github.com/jarun/nnn/blob/master/misc/quitcd/quitcd.bash_sh_zsh
n() {
  # Block nesting of nnn in subshells
  [ "${NNNLVL:-0}" -eq 0 ] || {
    echo "nnn is already running"
    return
  }

  # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
  # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
  # see. To cd on quit only on ^G, remove the "export" and make sure not to
  # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
  #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

  # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
  # stty start undef
  # stty stop undef
  # stty lwrap undef
  # stty lnext undef

  # The command builtin allows one to alias nnn to n, if desired, without
  # making an infinitely recursive alias
  command nnn "$@"

  [ ! -f "$NNN_TMPFILE" ] || {
    . "$NNN_TMPFILE"
    rm -f -- "$NNN_TMPFILE" >/dev/null
  }
}

# https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init bash)"
fi
