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
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls='ls -hF  --color=auto --group-directories-first'  # Classify in color
  alias lla='ls -lA --color=auto --group-directories-first'  # Long list all
else
  alias ls='ls -hF'   # Classify in color
  alias lla='ls -lA'  # Long list all
fi

# Interactive mode
alias cp='cp -i'
alias mv='mv -i'
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias rm='rm -I'
else
  alias rm='rm -i'
fi

# Misc
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias go='gnome-open'
fi
alias vim2='vim -O2'
