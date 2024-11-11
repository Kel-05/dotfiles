function wscan --wraps='nmcli device wifi rescan' --description 'alias wscan=nmcli device wifi rescan'
  nmcli device wifi rescan $argv
        
end
