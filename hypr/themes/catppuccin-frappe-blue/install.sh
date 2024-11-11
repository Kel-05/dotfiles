theme="$HOME/.config/hypr/themes/catppuccin-frappe-blue"

hyprland="$HOME/.config/hypr"
emacs="$HOME/.emacs.d"
gtk3="$HOME/.config/gtk-3.0"
gtk4="$HOME/.config/gtk-4.0"
waybar="$HOME/.config/waybar"
konsole="$HOME/.local/share/konsole"
micro="$HOME/.config/micro"
swaync="$HOME/.config/swaync"

fish -c "set -Ux HYPRLAND_THEME ${theme##*/}"

cp $theme/theme.conf $hyprland/theme.conf
cp $theme/theme.el $emacs/theme.el

emacsclient --eval "(load-theme 'catppuccin :no-confirm)"
emacsclient --eval "(catppuccin-load-flavor 'frappe)"

cp $theme/gtk-3.0-settings.ini $gtk3/settings.ini
cp $theme/gtk-4.0-settings.ini $gtk4/settings.ini
cp $theme/colorscheme.css $waybar/colorscheme.css

cp $theme/swaync-style.css $swaync/style.css
swaync-client -rs

pkill waybar
waybar &

plasma-apply-colorscheme CatppuccinFrappeBlue

cp $theme/konsole.colorscheme $konsole/konsole.colorscheme

fish -c "yes | fish_config theme save \"Catppuccin Frappe\""

cp $theme/micro-settings.json $micro/settings.json

cp $theme/wallpaper $hyprland/assets/wallpaper

if ! echo catppuccin-frappe-blue | grep $(hyprctl hyprpaper listloaded) > /dev/null; then
    hyprctl hyprpaper preload $theme/wallpaper
fi

hyprctl hyprpaper wallpaper , $theme/wallpaper
