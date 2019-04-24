[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

set -U fish_prompt_pwd_dir_length 0
set -x LANG en_GB.utf8

alias vim=nvim
alias :q=exit

# git
alias gs='git status'
alias gp='git pull'
alias gpush='git push'
alias gd='git diff -w'
alias gds='gd --staged'
alias gco='git checkout'
