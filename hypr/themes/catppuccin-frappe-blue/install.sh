theme="$HOME/.config/hypr/themes/catppuccin-frappe-blue"

hyprland="$HOME/.config/hypr"
emacs="$HOME/.emacs.d"
gtk3="$HOME/.config/gtk-3.0"
gtk4="$HOME/.config/gtk-4.0"
waybar="$HOME/.config/waybar"
konsole="$HOME/.local/share/konsole"
micro="$HOME/.config/micro"
swaync="$HOME/.config/swaync"
gitui="$HOME/.config/gitui"
kitty="$HOME/.config/kitty"
icons_index="$HOME/.local/share/icons/default/index.theme"

fish -c "set -Ux HYPRLAND_THEME ${theme##*/}"

cp $theme/theme.conf             $hyprland/theme.conf
cp $theme/theme.el               $emacs/theme.el
cp $theme/gtk-3.0-settings.ini   $gtk3/settings.ini
cp $theme/gtk-4.0-settings.ini   $gtk4/settings.ini

cp $theme/icons-index.theme      $icons_index
cp $theme/colorscheme.css        $waybar/colorscheme.css
cp $theme/swaync-style.css       $swaync/style.css
cp $theme/konsole.colorscheme    $konsole/konsole.colorscheme

cp $theme/gitui-theme.ron        $gitui/theme.ron
cp $theme/kitty-bg.conf          $kitty/kitty-bg.conf
cp $theme/micro-settings.json    $micro/settings.json
cp $theme/wallpaper              $hyprland/assets/wallpaper

gsettings set org.gnome.desktop.interface gtk-theme       catppuccin-frappe-blue-standard+default
gsettings set org.gnome.desktop.interface cursor-theme    catppuccin-frappe-blue-cursors
gsettings set org.gnome.desktop.interface icon-theme      Tela-circle-blue-dark

swaync-client -rs
pkill waybar
waybar &

plasma-apply-colorscheme CatppuccinFrappeBlue
fish -c "yes | fish_config theme save \"Catppuccin Frappe\""

if ! echo catppuccin-frappe-blue | grep $(hyprctl hyprpaper listloaded) > /dev/null; then
    hyprctl hyprpaper preload $theme/wallpaper
fi

hyprctl hyprpaper wallpaper , $theme/wallpaper

emacsclient --eval "(load-theme 'catppuccin :no-confirm)"
emacsclient --eval "(catppuccin-load-flavor 'frappe)"
