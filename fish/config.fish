if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (ssh-agent -c) > /dev/null
    set -g man_bold -o 8caaee
    set -g man_standout -b c6d0f5 303446
end
