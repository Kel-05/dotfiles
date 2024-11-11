theme="$HOME/.config/hypr/themes/catppuccin-latte-red"

hyprland="$HOME/.config/hypr"
emacs="$HOME/.emacs.d"
gtk3="$HOME/.config/gtk-3.0"
gtk4="$HOME/.config/gtk-4.0"
waybar="$HOME/.config/waybar"
konsole="$HOME/.local/share/konsole"
micro="$HOME/.config/micro"
swaync="$HOME/.config/swaync"
gitui="$HOME/.config/gitui"

fish -c "set -Ux HYPRLAND_THEME ${theme##*/}"

cp $theme/theme.conf $hyprland/theme.conf
cp $theme/theme.el $emacs/theme.el

emacsclient --eval "(load-theme 'catppuccin :no-confirm)"
emacsclient --eval "(catppuccin-load-flavor 'latte)"

cp $theme/gtk-3.0-settings.ini $gtk3/settings.ini
cp $theme/gtk-4.0-settings.ini $gtk4/settings.ini
cp $theme/colorscheme.css $waybar/colorscheme.css

pkill waybar
waybar &

cp $theme/swaync-style.css $swaync/style.css
swaync-client -rs

plasma-apply-colorscheme CatppuccinLatteRed

cp $theme/konsole.colorscheme $konsole/konsole.colorscheme
cp $theme/gitui-theme.ron $gitui/theme.ron

fish -c "yes | fish_config theme save \"Catppuccin Latte\""

cp $theme/micro-settings.json $micro/settings.json
cp $theme/wallpaper $hyprland/assets/wallpaper

if ! echo catppuccin-latte-red | grep $(hyprctl hyprpaper listloaded) > /dev/null; then
    hyprctl hyprpaper preload $theme/wallpaper
fi

hyprctl hyprpaper wallpaper , $theme/wallpaper
