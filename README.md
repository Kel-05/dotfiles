# Welcome to my dotfiles!
These are the configuration files I use, feel free to use them however you want!

For more information about each file, go to their respective directories.


# init.el (Emacs)
My Emacs configuration, featuring:

- Java, CUDA and C/CPP support
- Syntax check, highlighting and auto completion.
- Copy-paste outside of emacs on Wayland (wl-clipboard)
- Multiple cursors
- Markdown support
- Other QoL and IDE-like features

## Dependencies
Outside of [wl-clipboard](https://github.com/bugaevc/wl-clipboard), every package
declared in the config will be installed on first boot of Emacs. Check your distro
for the package or install it manually.

## Custom keymaps
command        |keymap|description
--------------:|:----:|:--------------------------------------------------------
mark-previous  |C->   |create a cursor on the previous instance of a marked word
mark-next      |C-<   |create a cursor on the next instance of a marked word
mark-all       |C-M-< |create a cursor on all instances of a marked word
duplicate-up   |M-up  |duplicate line upwards
duplicate-down |M-down|duplicate line downwards
yas-expand     |M-RET |expand snippet
kill-whole-line|C-k   |cut whole line
other-window   |C-tab |tab to other Emacs window


# Other
- grub - [catppuccin themed](https://github.com/catppuccin/grub) grub configuration
file. It also customizes the [tty](https://github.com/catppuccin/tty).
- kde.kksrc - My KDE Plasma 6 keybinds
- user.js - [betterfox](https://github.com/yokoffing/Betterfox)
