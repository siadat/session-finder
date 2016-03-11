# session-finder

Commands for session related tasks.

[![asciicast](https://asciinema.org/a/azyuneip94rgxcgx001kq42bd.png)](https://asciinema.org/a/azyuneip94rgxcgx001kq42bd)

## Install

	mkdir -p ~/.tmux/
    git clone https://github.com/siadat/session-finder ~/.tmux/session-finder
	~/.tmux/session-finder/install.bash

## Usage

    M-Space   new window
    M-l       select next window
    M-h       select prev window
    M-Tab     select last window
    M-L       move current window to right
    M-H       move current window to left
    M-Return  toggle pane fullscreen
    M--       scroll up
    M-+       scroll down

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
    bind-key -n 'M-`' run -b     './session-finder.bash next'
    bind-key -n 'M-~' run -b     './session-finder.bash prev'
    bind-key -n 'M-q' run -b     './session-finder.bash last'
    bind-key -n 'M-p' new-window './session-finder.bash finder'

Read [my blog post](http://siadat.github.io/tmux-session-management/) for more information.
