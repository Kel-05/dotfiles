theme_switcher="$HOME/.config/hypr/scripts/theme-switcher.sh"
theme_dir="$HOME/.config/hypr/themes"

if echo $(fish -c "echo \$HYPRLAND_THEME") | grep catppuccin-frappe-blue > /dev/null; then
  bash -c "$theme_switcher $theme_dir/catppuccin-latte-red"
else
  bash -c "$theme_switcher $theme_dir/catppuccin-frappe-blue"
fi
