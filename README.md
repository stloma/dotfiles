# .dotfiles

This is a collection of Neovim, tmux, zsh, ranger, and eslint configuration files.

If you decide to use the install.sh script, please be careful as it may overwrite your existing configuration files.

## Installation

```bash
git clone https://github.com/stloma/dotfiles && cd dotfiles && bash ./install.sh
```

This will symlink all the files to your home directory, create the Neovim cache directory and install Vundle

## Other configuration

Neovim plugins will have to be manually installed by running :VundleInstall as well as installing patched fonts for nerd-fonts
