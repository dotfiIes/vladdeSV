
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
alias ack='echo "use ripgrep \`rg\`, alternatively use \\ack"' # notifier to use ripgrep instead
alias ssh-nokey='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no' # ssh without providing ssh key
alias hos='sudo nvim /etc/hosts'             # short for editing hosts file
alias imagesize='sips -g pixelHeight -g pixelWidth $1' # get image size

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

# Path to your oh-my-zsh installation.
export ZSH="/Users/vladde/.oh-my-zsh"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump
  git
  cp
  xcode
  vscode
  vagrant
  thefuck
  sudo
  sublime
  ssh-agent
  screen
  react-native
  python
  node
  man
  iterm2
  git-extras
  encode64
  brew
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='nvim'

# ssh
 export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set colors for apropriate device
host_color='%{$fg[red]%}'
case $(uname -n) in
macaholic*)
  host_color='%{$fg[yellow]%}'
  ;;
miniholic*)
  host_color='%{$fg[yellow]%}'
  ;;
neobabe*)
  host_color='%{$fg[magenta]%}'
  ;;
babe*) # no longer with us. rip.
  host_color='%{$fg[blue]%}'
  ;;
esac

source /usr/local/bin/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
PROMPT='%{$fg[green]%}%n %{$fg[yellow]%}%m %{$fg[blue]%}%~%{$reset_color%}$(__git_ps1 " git:(%s)") $ '

alias gc='git commit -m'
alias gs='git status'
alias gt='git log --tree'

export PATH="/usr/local/opt/ldc/bin/:$PATH"

if [ -f ~/.extra_commands.sh ]; then source ~/.extra_commands.sh; fi
