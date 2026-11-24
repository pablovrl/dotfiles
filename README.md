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

## Omarchy (Linux only)

These settings require Omarchy and Hyprland's Lua configuration:

- `omarchy/foot/foot.ini`: Foot with JetBrainsMono Nerd Font at size 16,
  retaining Omarchy's live theme integration.
- `omarchy/hypr/floating-terminals.lua`: opens Omarchy floating terminals
  centered at 60% of the monitor's width and height, without resizing other apps.
- `omarchy/hypr/keyboard.lua`: US International keyboard layout (`us`, variant
  `intl`), with dead keys for accents.

Install from this repository's root (backs up existing files):

```sh
mkdir -p ~/.config/foot ~/.config/hypr
for file in foot/foot.ini hypr/floating-terminals.lua hypr/keyboard.lua; do
    target="$HOME/.config/$file"
    if [ -e "$target" ] || [ -L "$target" ]; then
        mv "$target" "$target.backup-$(date +%Y%m%d%H%M%S)"
    fi
    ln -s "$PWD/omarchy/$file" "$target"
done
```

Add this line at the end of `~/.config/hypr/hyprland.lua`, after Omarchy's
defaults. If the floating-terminal handler is already inline there, replace
that handler with this line instead of loading it twice:

```lua
require("hypr.floating-terminals")
```

Add this line to `~/.config/hypr/input.lua` to apply the keyboard layout:

```lua
require("hypr.keyboard")
```

Validate and reload:

```sh
hyprctl reload
hyprctl configerrors
```

Open a new Foot window to apply its font settings. The floating-terminal
handler applies to newly opened windows. Once linked, the desktop reads these
files directly from this repository.
