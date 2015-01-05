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
alias vim2='vim -O2'
