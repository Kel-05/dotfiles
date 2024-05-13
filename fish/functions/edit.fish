function edit --wraps='emacs -nc' --wraps='emacsclient -nc' --description 'alias edit=emacsclient -nc'
  emacsclient -nc $argv
        
end
