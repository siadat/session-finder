Suggested key bindings:

    set-option -g status-left   ' #(~/cloned/siadat/session-finder/session-finder status) '
    bind-key -n 'M-`' run-shell -b '~/cloned/siadat/session-finder/session-finder next'
    bind-key -n 'M-~' run-shell -b '~/cloned/siadat/session-finder/session-finder prev'
    bind-key -n 'M-q' run-shell -b '~/cloned/siadat/session-finder/session-finder last'
    bind-key -n 'M-p' new-window   '~/cloned/siadat/session-finder/session-finder finder'
