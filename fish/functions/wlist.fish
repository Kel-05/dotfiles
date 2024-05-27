function wlist --wraps='nmcli device wifi list' --description 'alias wlist=nmcli device wifi list'
  nmcli device wifi list $argv
        
end
