function wgup --wraps='sudo wg-quick up ~/.config/wireguard/wg0.conf' --description 'alias wgup=sudo wg-quick up ~/.config/wireguard/wg0.conf'
  ssh-add ~/.ssh/archeus
  sudo wg-quick up ~/.config/wireguard/wg0.conf $argv      
end
