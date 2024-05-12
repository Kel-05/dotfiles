# My dotfiles
My configuration files for all the software I use regurarly and daily.

# Descriptions
If you have trouble navigating this repository, here's a short description of all the files.
I would say this list is sorted from most to least important, so do what you want with this information.

- hypr/ - configuration files for the hyprland window manager and hypr* ecosystem, along with some custom scripts I use to make my life easier.
- waybar/ - configuration files for the waybar panel.
- init.el - configuration file for the GNU emacs editor.
- kde.kksrc - custom keybinds for the KDE Desktop Environment.
- .gitconfig - configuration file for the git versioning tool.
- .obsidian/ - configuration and plugins for the Obsidian markdown note-taking app.
- fish/ - configuration and plugins (including env vars) for the fish terminal shell.
- ssh/ -configuration file for ssh.

## Uninmportant configs
The following files have little to no differences from their default counterparts and may be ignored.

- kitty.conf - configuration file for the kitty terminal emulator.
- netbeans.conf - configuration file for the Netbeans IDE.
- cpupower - configuration file for the cpupower freq tool.
- grub - configuration file for the grub boot loader.
- user.js - configuration file for Firefox (forked from BetterFox).
- cava/ - configuration file for the cava TUI visualizer.

# Dependencies
Other than the software I mentioned earlier or that is explicited in the repo files, you're going to need the following in order for the init.el and hypr* config to work properly:

## init.el
you're going to need the [MELPA](https://melpa.org/#/) package repository in order to install most of these packages.

- rust-mode
- markdown-mode
- cargo-mode
- cargo
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
- wlogout - executed whenever CTRL ALT DEL is pressed, is a cool logout screen for wlroots-based compositors
- qt6ct - used to change the look fo qt-based apps (color scheme: [catppuccin-frappe](https://github.com/catppuccin/qt5ct), you can also use it for qt6ct)
- [Catppuccin-Frappe-Blue-Cursors](https://github.com/catppuccin/cursors) - The cursor I use
- [Catppuccin-Frappe-Standard-Blue-Dark](https://github.com/catppuccin/gtk) - GTK theme I use
- konsole, firefox, dolphin, wofi, obsidian, betterbird, emacs, hyprpicker - software i use and have keybinds set for it.
