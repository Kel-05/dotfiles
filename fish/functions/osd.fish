function osd --wraps='sudo systemctl start swayosd-libinput-backend.service && swayosd-server &; disown %1' --description 'alias osd=sudo systemctl start swayosd-libinput-backend.service && swayosd-server &; disown %1'
  sudo systemctl start swayosd-libinput-backend.service && swayosd-server &; disown %1 $argv
        
end
