function wgdown --wraps='sudo wg-quick down ~/.config/wireguard/wg0.conf' --description 'alias wgdown=sudo wg-quick down ~/.config/wireguard/wg0.conf'
  sudo wg-quick down ~/.config/wireguard/wg0.conf $argv
        
end
