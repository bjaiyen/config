# Aliases {
  # Changing dirs
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../..'
  alias .....='cd ../../../..'
  alias rsync='rsync -avzP'

  # Search
  alias ack='ack-grep -i'
  alias g='grep -Irnis --color'

  # Human readable
  alias df='df -h'
  alias du='du -h'

  # Some shortcuts for different directory listings
  alias ls='ls -hF  --color=auto --group-directories-first' # Classify in color
  alias ll='ls -l   --color=auto --group-directories-first' # Long list
  alias la='ls -A   --color=auto --group-directories-first' # All but . and ..
  alias lla='ls -lA --color=auto --group-directories-first' # Prev two combined

  # Interactive mode
  alias cp='cp -i'
  alias mv='mv -i'
  alias rm='rm -I'

  # Misc
  alias go='gnome-open'
  alias vim='vim'
  alias vim2='vim -O2'
# }

# Appearance {
  # Look for active branch (* branch) and remove the asterisk
  function parse_git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
  }

  # Display current working directory in prompt
  # \u user, \h host, \w cwd, \W cwd base
  # \ek and \e\ are delimiters for screen(1) window titles
  # \[ \] hold sequence of non-printing characters
  export PS1="\n\u@\h:\w\n\$(parse_git_branch)\$ "
  case $TERM in 
    screen*)
      export PS1='\[\ek\W\e\\\]'${PS1}
      ;;
  esac
# }

# Functions {
  # Zip a folder into a .zip file with the same name as the folder.
  function zipf {
    zip -r $(echo "$1" | sed "s|/$||") $1
  }
# }

# Shell Options {
  # Don't wait for job termination notification
  set -o notify

  # Use case-insensitive filename globbing
  shopt -s nocaseglob

  # Make bash append rather than overwrite the history on disk
  shopt -s histappend

  # When changing directory small typos can be ignored by bash
  # for example, cd /vr/lgo/apaache would find /var/log/apache
  shopt -s cdspell
# }

# Variables {
  export IGNOREEOF=2            # Ignores two ctrl-D for exiting shell
  export HISTSIZE=10000         # History buffer size
  export HISTCONTROL=ignoredups # Remove consecutive duplicate commands in hist
# }
