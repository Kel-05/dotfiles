function wdel --wraps='nmcli connection delete' --description 'alias wdel=nmcli connection delete'
  nmcli connection delete $argv
        
end
