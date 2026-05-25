alias vim=nvim
alias htop=btop
alias lg=lazygit

if ! podman -v &>/dev/null; then
  alias podman='flatpak-spawn --host podman'
fi

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export PATH=$PATH:$HOME/go/bin

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
