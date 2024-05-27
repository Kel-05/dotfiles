function wlink --wraps='nmcli device wifi connect' --description 'alias wlink=nmcli device wifi connect'
  nmcli device wifi connect $argv
        
end
