if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (ssh-agent -c) > /dev/null
    set -g man_bold -o 8caaee
    set -g man_standout -b c6d0f5 303446
    fish_add_path ~/.local/bin
    set -Ux DOTNET_ROOT $HOME/.dotnet
    fish_add_path $DOTNET_ROOT
    fish_add_path $DOTNET_ROOT/tools
end
