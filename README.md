Read [my blog post](http://siadat.github.io/tmux-session-management/) for more information.

Suggested key bindings:

    set-option -g status-left ' #(./session-finder.bash status) '
    bind-key -n 'M-`' run -b     './session-finder.bash next'
    bind-key -n 'M-~' run -b     './session-finder.bash prev'
    bind-key -n 'M-q' run -b     './session-finder.bash last'
    bind-key -n 'M-p' new-window './session-finder.bash finder'
