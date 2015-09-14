Blog post https://siadat.github.io/2015/09/11/tmux-session-management

Requires [fzf](https://github.com/junegunn/fzf).

Build `crystal build session-finder.cr` or download [binaries]().

Suggested key bindings:

    set-option -g status-left   ' #(~/cloned/siadat/session-finder/session-finder status) '
    bind-key -n 'M-`' run-shell -b '~/cloned/siadat/session-finder/session-finder next'
    bind-key -n 'M-~' run-shell -b '~/cloned/siadat/session-finder/session-finder prev'
    bind-key -n 'M-q' run-shell -b '~/cloned/siadat/session-finder/session-finder last'
    bind-key -n 'M-p' new-window   '~/cloned/siadat/session-finder/session-finder finder'
