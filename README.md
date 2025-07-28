# My Dotfiles ⚙️

These dotfiles contain my personal configurations, primarily used on [Fedora Silverblue](https://fedoraproject.org/atomic-desktops/silverblue/) systems.

## Installation 🚀

These dotfiles can be easily installed using [GNU Stow](https://www.gnu.org/software/stow/).

1. Clone the repository:

```bash
git clone https://github.com/nimelo/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Install using Stow:

Use the `--target=$HOME` flag to link the dotfiles to your home directory.

To link all configurations:

```bash
stow --target=$HOME */
```

*Note: Ensure you are in the `~/.dotfiles` directory when running stow commands.*

## License 📄

This project is licensed under the [GNU General Public License v3.0](LICENSE).

