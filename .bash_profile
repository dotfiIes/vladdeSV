# Load scripts if existing
if [ -f /usr/local/bin/git-completion.bash ]; then source /usr/local/bin/git-completion.bash;   else echo "!> 'git-completion.bash' not found ( https://github.com/git/git/blob/master/contrib/completion/git-completion.bash )"; fi
if [ -f /usr/local/bin/git-prompt.sh       ]; then source /usr/local/bin/git-prompt.sh;         else echo "!> 'git-prompt.sh' not found ( https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh )"; fi
if [ $(type -t autojump)                   ]; then source /usr/local/etc/profile.d/autojump.sh; else echo "!> 'autojump' not installed ( https://github.com/wting/autojump )"; fi
if [ $(type -t thefuck)                    ]; then eval $(thefuck --alias);                     else echo "!> 'thefuck' not installed ( https://github.com/nvbn/thefuck )"; fi

# If SSH connection, display hostname
if [ "$SSH_CONNECTION" ]; then host=' \[\033[38;5;11m\]\h'; else host=''; fi

# Set the prompt
#emojis=("🍍" "🍌")
export PS1="\[\033[38;5;10m\]\u$host\[\033[38;5;15m\] \[\033[38;5;45m\]\w\[\033[39m\]\$(__git_ps1 \" \[\033[39m\]git:(\[\033[38;5;198m\]%s\[\033[39m\])\")\[\033[0m\] \$ "

bind 'set mark-symlinked-directories on'    # Auto-complete symlinks
bind 'set completion-ignore-case on'        # Auto-complete case-insensetive

alias :q=exit                               # Quick-command to exit
alias bea=git                               # By coincidence, the word 'pull' (from `git pull`) is very similar to the Swedish word 'pulla', which is used to describe women masturbating. So by aliasing git to my girlfriend's name, I can also have a laugh when I fetch and merge repositories :^)
alias cwd=pwd                               # How I prefer to get the working directory
alias mc='LANG=en_EN.UTF-8 mc'              # Open Midnight Commander in english
alias cp='cp -iv'                           # Preferred implementation
alias mv='mv -iv'                           # -''-
alias mkdir='mkdir -pv'                     # -''-
alias ll='ls -FGlAhp'                       # Preferred listing for OS X
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cd..='cd ../'                         # cd alternation
alias ..='cd ../'                           # -''-
alias ...='cd ../../'                       # -''-
alias ....='cd ../../../'                   # -''-
alias .....='cd ../../../../'               # -''-
alias ......='cd ../../../../../'           # -''-
alias ~="cd ~"                              # Go to home directory
alias which='type -all'                     # Find location of executable
alias path='echo -e ${PATH//:/\\n}'         # List all paths in $PATH
alias qfind="find . -name "                 # Search for filename in current directory
alias ip='curl ifconfig.co'                 # Get the public IP of the computer
alias local-ip='ipconfig getifaddr en0'     # Get the local IP of the computer
alias finder='open -a Finder ./i'           # Open Finder in current directory
alias add-dock-space="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type=\"spacer-tile\";}' && killall Dock" # Add a blank-space to the dock.

title() { echo -ne "\033]0;$1\007"; }       # Set the title for the terminal
todo() {                                    # Say a nice quote :)
    if [[ $(type -t say) ]]; then
        sayings=("please, eat my ass")  # I plan to add other things in here later on :)
        say ${sayings[$RANDOM % ${#sayings[@]}]}
    else
        echo "!> command 'say' not available"
    fi
}
mcd () { mkdir -p "$1" && cd "$1"; }         # Make a directory and move into it
trash () { command mv "$@" ~/.Trash ; }      # Move file to the thrash
zipf () { zip -r "$1".zip "$1" ; }           # .zip a file
extract () {                                 # Extract a file from a compressed format
    if [ -f $1 ]; then
        case $1 in
        *.tar.bz2)  tar xjf $1     ;;
        *.tar.gz)   tar xzf $1     ;;
        *.bz2)      bunzip2 $1     ;;
        *.rar)      unrar e $1     ;;
        *.gz)       gunzip $1      ;;
        *.tar)      tar xf $1      ;;
        *.tbz2)     tar xjf $1     ;;
        *.tgz)      tar xzf $1     ;;
        *.zip)      unzip $1       ;;
        *.Z)        uncompress $1  ;;
        *.7z)       7z x $1        ;;
        *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
     else
         echo "'$1' is not a valid file"
     fi
}

# I took inspiration (and sometimes plainly copied) from https://frd.mn/ and https://natelandau.com/ :pray:

