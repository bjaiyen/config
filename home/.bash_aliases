# Changing dirs
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Moving files
alias rsync='rsync -avzP'

# Search
alias g='grep -Irnis --color'

# Human readable
alias df='df -h'
alias du='du -h'

# Directory listing
case $OSTYPE in
linux-gnu|cygwin)
  alias ls='ls -hF  --color=auto --group-directories-first'  # Classify in color
  alias lla='ls -lA --color=auto --group-directories-first'  # Long list all
  ;;
*)
  alias ls='ls -hF'   # Classify in color
  alias lla='ls -lA'  # Long list all
  ;;
esac

# Interactive mode
alias cp='cp -i'
alias mv='mv -i'
case $OSTYPE in
linux-gnu|cygwin)
  alias rm='rm -I'
  ;;
*)
  alias rm='rm -i'
  ;;
esac

# Misc
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias go='gnome-open'
fi
alias vim2='vim -O2'
