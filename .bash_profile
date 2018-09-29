# Load scripts which should not be available online :^)
if [ -f ~/.bash_extra.bash ]; then source ~/.bash_extra.bash; fi

# Load scripts if existing
if [ -f /usr/local/bin/git-completion.bash ]; then source /usr/local/bin/git-completion.bash;   else echo "!> 'git-completion.bash' not found ( https://github.com/git/git/blob/master/contrib/completion/git-completion.bash )"; fi
if [ -f /usr/local/bin/git-prompt.sh       ]; then source /usr/local/bin/git-prompt.sh;         else echo "!> 'git-prompt.sh' not found ( https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh )"; fi
if [ $(type -t autojump)                   ]; then source /usr/local/etc/profile.d/autojump.sh; else echo "!> 'autojump' not installed ( https://github.com/wting/autojump )"; fi
if [ $(type -t thefuck)                    ]; then eval $(thefuck --alias);                     else echo "!> 'thefuck' not installed ( https://github.com/nvbn/thefuck )"; fi
if [ -z $(type -t rg)                      ]; then                                                   echo "!> 'ripgrep' not installed ( https://github.com/BurntSushi/ripgrep )"; fi

# Set the prompt
#emojis=("🍍" "🍌")

host_color='[91;5;11m'
case $(uname -n) in
macaholic*)
  host_color='[33;11m'
  ;;
miniholic*)
  host_color='[33;1;11m'
  ;;
neobabe*)
  host_color='[91;5;11m'
  ;;
babe*)
  host_color='[34;5;11m'
  ;;
esac
export PS1="\[\033[38;5;10m\]\u \[\033$host_color\]\h\[\033[38;5;15m\] \[\033[38;5;45m\]\w\[\033[39m\]\$(__git_ps1 \" \[\033[39m\]git:(\[\033[38;5;198m\]%s\[\033[39m\])\")\[\033[0m\] \$ "

bind 'set mark-symlinked-directories on'    # Auto-complete symlinks
bind 'set completion-ignore-case on'        # Auto-complete case-insensetive

alias sudo='sudo '                          # Command following sudo will check for aliases, eg. 'sudo vim' → 'sudo nvim' per definition below
alias vim=nvim                              # In this house we no longer use vim......
alias nano=nvim                             # -''-
alias :q=exit                               # Quick-command to exit
alias bea=git                               # By coincidence, the word 'pull' (from `git pull`) is very similar to the Swedish word 'pulla', which is used to describe women masturbating. So by aliasing git to my girlfriend's name, I can also have a laugh when I fetch and merge repositories :^)
alias cwd=pwd                               # How I prefer to get the working directory
alias mc='LANG=en_EN.UTF-8 mc'              # Open Midnight Commander in english
alias cp='cp -iv'                           # Preferred implementation
alias mv='mv -iv'                           # -''-
alias mkdir='mkdir -pv'                     # -''-
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
alias finder='open -a Finder .'             # Open Finder in current directory
alias add-dock-space="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type=\"spacer-tile\";}' && killall Dock" # Add a blank-space to the dock.
alias ll='exa -lgh -s=type'                 # exa is better than ls. Fite me.
alias tree='exa --tree -s=type'             # exa's tree output is much easier on the eyes.
alias ack='echo "use ripgrep \`rg\`, alternatively use \\ack"'
alias ssh-nokey='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'

cdu() {                                     # Short for "change directory upwards"
    if [ "$1" -eq "$1" ] 2>/dev/null; then
        cd $(printf '../%.0s' $(seq 1 $1))
    else
        echo "$1 is not a natural number (positive whole number) greater than 0"
    fi
}
ssh-key-match() { [[ $(ssh-keygen -y -e -f $1) = $(ssh-keygen -y -e -f $2) ]] && echo "matching" || echo "not matching"; } # Check if two SSH keys are matching (aka private and public key pairs)
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


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

