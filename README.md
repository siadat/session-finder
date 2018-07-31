# session-finder

Commands for session related tasks.

[![asciicast](https://asciinema.org/a/azyuneip94rgxcgx001kq42bd.png)](https://asciinema.org/a/azyuneip94rgxcgx001kq42bd)

## Install

    mkdir -p ~/.tmux/
    git clone https://github.com/siadat/session-finder ~/.tmux/session-finder
    ~/.tmux/session-finder/install.bash

## Usage

    M-p       Open session finder (uses fzf)
    M-`	      Go to next session
    M-~	      Go to previous session
    M-q       Go to the last session (toggle back and forth)

## Usage without install.bash

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
    bind-key -n 'M-p' new-window './session-finder.bash finder'
    bind-key -n 'M-`' run -b     './session-finder.bash next'
    bind-key -n 'M-~' run -b     './session-finder.bash prev'
    bind-key -n 'M-q' run -b     './session-finder.bash last'

Read [my blog post](https://siadat.github.io/post/tmux-session-management) for more information.
