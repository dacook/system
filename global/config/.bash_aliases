# David's Aliases
# check out some more cool ideas here: http://natelandau.com/my-mac-osx-bash_profile/

#SVN
alias sup="svn update"
alias ss="svn status"
alias sd="svn diff \"$@\" | less -R" # make svn diff scrollable

#GIT
function gitRemoteBranch() { git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD); }
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached" # Diff staged changes
# alias gdt="git difftool -t opendiff -y" #use Xcode’s FileMerge
alias gdt="git difftool -t diffmerge -y" #diffmerge is better
alias gp="git pull" 
alias gpr="git pull --rebase" 
# alias gr="git rebase $( gitRemoteBranch )" # Quick git pull (no fetch) # actually I think what I want is rebase with no params. hmm why not just merge $( gitRemoteBranch )
alias gpq="git merge --ff-only $(gitRemoteBranch)" # Quick git pull (no fetch, just fast-forward to last known commit) 
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
alias devts="npm run dev:ts"

#Sublime - Open project file if it exists, otherwise open dir. TODO: should probably change to a function and accept a parameter
alias st="if [ -e *.sublime-project ]; then subl *.sublime-project; else subl .; fi"

#Mirror
# alias mirror="sudo -u apache php packages/mirror/scripts/mirror.php"
alias mirror="packages/mirror/mirror"

#Other
function dt() { echo $( date +%Y-%m-%d ); }
# alias rm="trash" # hasseg.org/trash #TODO: write a wrapper to better support rm flags
alias pd="pushd" # a nice alternative to cd
alias ll="ls -lh"
alias la="ls -lah"
alias ltr="ls -ltr | tail" #show most recent files in folder
alias beep="tput bel"
alias bell="beep"
alias hr="echo -e \"\n${RED}-------------${RESET}\n\""
tgz() { tar -cvzf "$1.tgz" "$1"; echo -n "Done: "; du -h "$1.tgz"; } # Because I can never remember how to
#alias watchlog="watch 'df -h /dev/xvda1; ls -tr *.log; tail `ls -t *.log | head -n1`'" # Watch disk space and most recent log file
alias pserve="(sleep 1; open http://0.0.0.0:8080) & python -m SimpleHTTPServer 8080 2>/dev/null;" # Start Python HTTP server in current dir and open in browser. Note that the browser will cache requests because no uncacheable headers are sent. [There's no easy way](http://stackoverflow.com/questions/12499171/can-i-set-a-header-with-pythons-simplehttpserver).

alias headers="curl -svI $1 2>/dev/null" # I don't know why this works.. I though aliases can't handle parameters. but note that -I sends a HEAD instead of GET, which may produce different results.
alias vcurl="curl -sv $1 2>&1" # verbose curl directed to stout
alias vhcurl="curl -sv $1 2>&1 >/dev/null" # verbose curl headers only directed to stout
alias highlight-colon='sed -E -e "s/^([^:]*\:)/$GREEN\1$RESET/g"' #higlight everything before the first colon on each line.

# Exclude node_modules from OSX indexing: https://github.com/yarnpkg/yarn/issues/6453#issuecomment-476048618
alias fix-spotlight='find . -type d -name "node_modules" -exec touch "{}/.metadata_never_index" \;'
