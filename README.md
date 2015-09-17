Commands for session related tasks.

![Session Fuzzy Finder](http://siadat.github.io/assets/tmux/2.png)

Print a pretty list of session names to be used by status-left:

    ./session-finder.bash status

Start [fzf](https://github.com/junegunn/fzf) and find or create a named sessions:

    ./session-finder.bash finder

Switch to the last session:

    ./session-finder.bash last

Switch to the next session:

    ./session-finder.bash next

Switch to the previous session:

    ./session-finder.bash prev


Suggested config:

    set-option -g status-left ' #(./session-finder.bash status) '
    bind-key -n 'M-`' run -b     './session-finder.bash next'
    bind-key -n 'M-~' run -b     './session-finder.bash prev'
    bind-key -n 'M-q' run -b     './session-finder.bash last'
    bind-key -n 'M-p' new-window './session-finder.bash finder'

Read [my blog post](http://siadat.github.io/tmux-session-management/) for more information.
