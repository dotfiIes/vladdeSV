# If SSH connection, display hostname
if [ "$SSH_CONNECTION" ]; then 
    host=' \[\033[38;5;11m\]\h'
else
    host=''
fi

# Set the prompt
export PS1="\[\033[38;5;10m\]\u$host\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;45m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \\$ \[$(tput sgr0)\]"

alias ls="ls -G"
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# Load scripts if existing
[ -f /usr/local/bin/git-completion.bash ] && . /usr/local/bin/git-completion.bash
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Auto-complete symlinks
bind 'set mark-symlinked-directories on'
# Auto-complete case-insensetive
bind 'set completion-ignore-case on'

alias qq=exit
