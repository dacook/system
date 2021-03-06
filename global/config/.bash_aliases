# David's Aliases
# check out some more cool ideas here: http://natelandau.com/my-mac-osx-bash_profile/

# Load global aliases (these can also copied onto servers) -- actually this file is already the global one! anything not global would be env-specific
# . ~/system/global/config/global.bash_aliases

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
# alias gdt="git difftool -t diffmerge -y" #diffmerge is better
alias gdt="git difftool --dir-diff"
alias gp="git pull" 
alias gpr="git pull --rebase" 
# alias gr="git rebase \$( gitRemoteBranch )" # Quick git pull (no fetch) # actually I think what I want is rebase with no params. hmm why not just merge $( gitRemoteBranch )
alias gpq="git merge --ff-only \$(gitRemoteBranch)" # Quick git pull (no fetch, just fast-forward to last known commit) 
alias ga="git add --all" 
# alias gci="git commit -m \"$@\""
# gci() { git commit -m "$@"; }  # Can't get these to work, but probably better not to make committing too easy.

# Ruby
alias be="bundle exec"
alias rserver="bundle exec rails server"
alias rconsole="bundle exec rails console"
# Rubocop on uncommitted files or files modified since master. Hmm but if I run without bundle it's super fast anyway.
alias rcu="git ls-files -m | xargs ls -1 2>/dev/null | xargs bundle exec rubocop" #runs on files that should be excluded
alias rcm="git diff-tree -r --no-commit-id --name-only head origin/master | xargs bundle exec rubocop"
alias z="zeus"
alias zs="bundle && be rake db:migrate db:test:prepare && zeus start" #prepare bundle and db before serving. was zeus meant to be run with bundle exec?
alias headless="FIREFOX_ARGS=-headless bundle exec" #run with headless arg
# Run rspec with zeus if running, else bundle
alias rspec='$(zeus rspec > /dev/null && echo "zeus" || echo "bundle exec") rspec'

#WIP Test any recently updated files. can it be cleaner? also handle when there's none.
function recent-ruby-files() {
  MINS=120
  echo $(gfind . -type f -cmin -$MINS -not -path '*/\.*' -not -path './log/*' -path '.rb' -printf '%p ')
}
alias rspec-recent="rspec \$(recent-ruby-files)"
alias rubocop-recent="rubocop \$(recent-ruby-files)"

#Sublime - Open project file if it exists, otherwise open dir. TODO: should probably change to a function and accept a parameter
alias st="if [ -e *.sublime-project ]; then subl *.sublime-project; else subl .; fi"


#General
function dt() { echo $( date +%Y-%m-%d ); }
# alias rm="trash" # hasseg.org/trash #TODO: write a wrapper to better support rm flags
alias pd="pushd" # a nice alternative to cd
# List in long format, with human-readable filesizes and show slashes for folders
alias ll="ls -lhF"
alias la="ls -lahF"
alias ltr="ls -ltr | tail" #show most recent files in folder
alias less="less -r" # Could have set in $LESS but meh.
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
