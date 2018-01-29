# If SSH connection, display hostname
if [ "$SSH_CONNECTION" ]; then
    host=' \[\033[38;5;11m\]\h'
else
    host=''
fi

# Load scripts if existing
if [ -f /usr/local/bin/git-completion.bash   ]; then . /usr/local/bin/git-completion.bash;   else echo "> git-completion.bash not found"; fi
if [ -f /usr/local/bin/git-prompt.sh         ]; then . /usr/local/bin/git-prompt.sh;         else echo "> git-prompt.sh not found"; fi
if [ -f /usr/local/etc/profile.d/autojump.sh ]; then . /usr/local/etc/profile.d/autojump.sh; else echo "> autojump.sh not found"; fi

# Set the prompt
export PS1="\[\033[38;5;10m\]\u$host\[\033[38;5;15m\] \[\033[38;5;45m\]\w\[\033[39m\]\$(__git_ps1 \" \[\033[39m\]git:(\[\033[38;5;198m\]%s\[\033[39m\])\") 🍍  \[$(tput sgr0)\]"

# Auto-complete symlinks
bind 'set mark-symlinked-directories on'
# Auto-complete case-insensetive
bind 'set completion-ignore-case on'

# Quick-command to exit
alias qq=exit
alias :q=exit

# By coincidence, the word 'pull' (from `git pull`) is very similar to the Swedish word 'pulla', which is used to describe women masturbating.
# So by aliasing git to my girlfriend's name, I can also have a laugh when I fetch and merge repositories :^)
alias bea=git

# How I prefer to get the working directory
alias cwd=pwd

# OS X specific
alias finder='open -a Finder ./'
alias kill-audio='sudo killall coreaudiod'
alias add-dock-space="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type=\"spacer-tile\";}' && killall Dock"

# from that guy Nate
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -FGlAhp'
alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias ~="cd ~"
alias which='type -all'
alias path='echo -e ${PATH//:/\\n}'
alias qfind="find . -name "
alias ip='curl ifconfig.co'
alias local-ip='ipconfig getifaddr en0'
mcd () { mkdir -p "$1" && cd "$1"; }
trash () { command mv "$@" ~/.Trash ; }
zipf () { zip -r "$1".zip "$1" ; }
extract () {
	if [ -f $1 ] ; then
	  case $1 in
		*.tar.bz2)   tar xjf $1     ;;
		*.tar.gz)    tar xzf $1     ;;
		*.bz2)       bunzip2 $1     ;;
		*.rar)       unrar e $1     ;;
		*.gz)        gunzip $1      ;;
		*.tar)       tar xf $1      ;;
		*.tbz2)      tar xjf $1     ;;
		*.tgz)       tar xzf $1     ;;
		*.zip)       unzip $1       ;;
		*.Z)         uncompress $1  ;;
		*.7z)        7z x $1        ;;
		*)     echo "'$1' cannot be extracted via extract()" ;;
		 esac
	 else
		 echo "'$1' is not a valid file"
	 fi
}

# I took inspiration from https://frd.mn/ and https://natelandau.com/ :pray:

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
eval $(thefuck --alias)
