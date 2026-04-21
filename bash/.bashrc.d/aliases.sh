# Aliases
alias vim=nvim
alias htop=btop
alias lg=lazygit

if ! podman -v &>/dev/null; then
    alias podman='flatpak-spawn --host podman'
fi

if ! xdg-open -v &>/dev/null; then
    alias xdg-open='flatpak-spawn --host xdg-open'
fi
