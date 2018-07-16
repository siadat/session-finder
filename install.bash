#!/usr/bin/env bash
dir=~/.tmux/session-finder
config=~/.tmux.conf
err=

# Check requirements
hash fzf 2> /dev/null ; if [ $? -eq 1 ]; then
  err=1
fi

hash fzf 2> /dev/null ; if [ $? -eq 1 ]; then
  err=1
fi

if [ "$err" = "1" ]; then
  echo >&2 "error:  fzf is required"
  echo >&2 "error:  Please see https://github.com/junegunn/fzf/blob/master/README.md"
  echo >&2 "error:  Run this script again once fzf is installed."
  exit 1
fi

cat >> $config <<- EOM

# ############################################
# Added by session finder's install script.
source-file $dir/session-finder.conf

EOM

tmux source-file $config
echo "Key bindings added to $config"
echo "See $dir/session-finder.conf to modify the keybindins."
