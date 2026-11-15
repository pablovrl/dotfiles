# Dotfiles

Shared configuration for macOS and Linux.

## Zsh aliases

Add this line to `~/.zshrc`, adjusting the path if you clone the repository elsewhere:

```zsh
source ~/work/dotfiles/zsh/aliases.zsh
```

Reload the configuration:

```zsh
source ~/.zshrc
```

## Kitty

The configuration in `kitty/kitty.conf` contains the active settings from the
original configuration, without Kitty's commented examples.

Link it on macOS or Linux, adjusting the repository path if needed:

```sh
mkdir -p ~/.config/kitty
if [ -e ~/.config/kitty/kitty.conf ] || [ -L ~/.config/kitty/kitty.conf ]; then
    mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.backup-$(date +%Y%m%d%H%M%S)
fi
ln -s ~/work/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

Restart Kitty to load the configuration. `super` means Command on macOS and
the Super/Windows key on Linux.
