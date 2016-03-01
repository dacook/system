# David's Aliases
# check out some more cool ideas here: http://natelandau.com/my-mac-osx-bash_profile/

#SVN
alias sup="svn update"
alias ss="svn status"
alias sd="svn diff \"$@\" | less -R" # make svn diff scrollable

#GIT
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached" # Diff staged changes
# alias gdt="git difftool -t opendiff -y" #use Xcode’s FileMerge
alias gdt="git difftool -t diffmerge -y"
alias gp="git pull --rebase"
alias ga="git add --all"
# alias gci="git commit -m \"$@\""
# gci() { git commit -m "$@"; }  # Can't get these to work, but probably better not to make committing too easy.

# Can't be bothered figuring out how to fix this properly
alias gitlab="/usr/local/bin/gitlab"

#Boilerplate (Gulp)
# I once had a really confusing issue that was solved by running grunt clean. So it's worth doing regularly.
alias gb="gulp build"
alias gw="gulp clean; gulp build; gulp watch"
alias gserve="gulp clean; gulp serve --open=false"

#Mirror
alias mirror="sudo -u apache php packages/mirror/scripts/mirror.php"

#Other
# alias rm="trash" # from morgant/tools-osx
alias pd="pushd" # a nice alternative to cd
alias ll="ls -lh"
alias la="ls -lah"
alias beep="tput bel"
alias bell="beep"
#alias watchlog="watch 'df -h /dev/xvda1; ls -tr *.log; tail `ls -t *.log | head -n1`'" # Watch disk space and most recent log file
alias pserve="python -m SimpleHTTPServer 8080 2>/dev/null" # Start Python HTTP server in current dir

alias headers="curl -svI $1 2>/dev/null"