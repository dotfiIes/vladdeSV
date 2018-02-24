# Load scripts if existing
if [ -f /usr/local/bin/git-completion.bash   ]; then . /usr/local/bin/git-completion.bash;   else echo "> 'git-completion.bash' not found ( https://github.com/git/git/blob/master/contrib/completion/git-completion.bash )"; fi
if [ -f /usr/local/bin/git-prompt.sh         ]; then . /usr/local/bin/git-prompt.sh;         else echo "> 'git-prompt.sh' ( https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh ) not found"; fi
if [         ! $(type -t autojump)           ]; then                                              echo "> 'autojump' ( https://github.com/wting/autojump ) not installed"; fi
if [           $(type -t thefuck)            ]; then eval $(thefuck --alias);                else echo "> 'thefuck' ( https://github.com/nvbn/thefuck ) not installed"; fi
# If SSH connection, display hostname
if [ "$SSH_CONNECTION" ]; then host=' \[\033[38;5;11m\]\h'; else host=''; fi
# Set the prompt
emojis=("🍍" "🍌")
export PS1="\[\033[38;5;10m\]\u$host\[\033[38;5;15m\] \[\033[38;5;45m\]\w\[\033[39m\]\$(__git_ps1 \" \[\033[39m\]git:(\[\033[38;5;198m\]%s\[\033[39m\])\")\[\033[0m\] ${emojis[$RANDOM % ${#emojis[@]}]} "

# Set the title for the terminal
title() { echo -ne "\033]0;$1\007"; }
todo() {
  if [[ $(type -t say) ]]; then
    sayings=("please, eat my ass") # I plan to add other things in here later on :)
    say ${sayings[$RANDOM % ${#sayings[@]}]}
  else
    echo "> command 'say' not available"
  fi
}

bind 'set mark-symlinked-directories on' # Auto-complete symlinks
bind 'set completion-ignore-case on' # Auto-complete case-insensetive

alias :q=exit # Quick-command to exit
alias bea=git # By coincidence, the word 'pull' (from `git pull`) is very similar to the Swedish word 'pulla', which is used to describe women masturbating. So by aliasing git to my girlfriend's name, I can also have a laugh when I fetch and merge repositories :^)
alias cwd=pwd # How I prefer to get the working directory
alias mc='LANG=en_EN.UTF-8 mc' # Open Midnight Commander in english
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -FGlAhp'
alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ~="cd ~"
alias which='type -all'
alias path='echo -e ${PATH//:/\\n}'
alias qfind="find . -name "
alias ip='curl ifconfig.co'
alias local-ip='ipconfig getifaddr en0'
alias finder='open -a Finder ./' # Open Finder in current directory
alias add-dock-space="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type=\"spacer-tile\";}' && killall Dock" # Add a blank-space to the dock.
mcd () { mkdir -p "$1" && cd "$1"; }
trash () { command mv "$@" ~/.Trash ; }
zipf () { zip -r "$1".zip "$1" ; }
extract () {
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

