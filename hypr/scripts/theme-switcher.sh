theme=$1

if [ -z "$theme" ]; then
  echo "Usage: $0 <theme>"
  exit 1
fi

if [ ! -d "$theme" ]; then
  echo "Theme '$theme' not found"
  exit 1
fi

if echo $(fish -c "echo \$HYPRLAND_THEME") | grep ${theme##*/}; then
  exit 0
fi

bash $theme/install.sh
