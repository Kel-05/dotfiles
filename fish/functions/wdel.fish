function wdel --wraps='nmcli con delete' --description 'alias wdel=nmcli con delete'
  nmcli con delete $argv
        
end
