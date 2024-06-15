# # Warning
This README is outdated af. I'll update it once I find the time.

# Descriptions
If you have trouble navigating this repository, here's a short description of some of the files.
I would say this list is sorted from most to least important, so do what you want with this information.

- hypr/ - Hyprland and hypr* config files + some custom scripts.
- init.el - Emacs config file
- kde.kksrc - custom keybinds for KDE.
- .obsidian/ - config and plugins for Obsidian.
- fish/ - config and plugins for fish shell.

# Dependencies
Other than the software I mentioned earlier or that is explicited in the repo files, you're going to need the following in order for the init.el and hypr* config to work properly:

## init.el
you're going to need the [MELPA](https://melpa.org/#/) package repository in order to install most of these packages.

- markdown-mode
- flycheck
- lsp-ui
- lsp-mode
- magit
- yasnippet
- company
- [catppuccin-theme](https://github.com/catppuccin/emacs)

Note: change or delete line 34 as it is a system-specific configuration.

## hypr*
you'll need the following software if you want to use the config as it is:

- grimblast - used for the screenshot binds
- wlogout - executed whenever `CTRL ALT DEL` is pressed, is a cool logout screen for wlroots compositors
- qt6ct - used to change the look fo qt-based apps (color scheme: [catppuccin-frappe](https://github.com/catppuccin/qt5ct), you can also use it for qt6ct)
- [Catppuccin-Frappe-Blue-Cursors](https://github.com/catppuccin/cursors) - The cursor I use.
- [Catppuccin-Frappe-Standard-Blue-Dark](https://github.com/catppuccin/gtk) - GTK theme I use.
- Catppuccin-Frappe and Tela-circle-blue-dark icons - used for some of the scripts.
- konsole, firefox, dolphin, wofi, obsidian, betterbird, emacs, hyprpicker - software i use and have keybinds set for it.
