function wdown --wraps='nmcli connection down' --description 'alias wdown=nmcli connection down'
  nmcli connection down $argv
        
end
