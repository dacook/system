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
alias gbr="git branch --sort=-committerdate --color=always | head" # show most recently updated branches
alias grc="git rebase --continue"

#todo: make these work. because of the subshell i don't think it will work as a git alias.  hmm unless u use a backalsh like `gpq` above?
# Stash shortcuts (https://stackoverflow.com/a/68241237/421243)
git config --global alias.stash-staged 'stash push --include-untracked -- $(git diff --staged --diff-filter=d --name-only)'
git config --global alias.stash-unstaged 'stash push --keep-index --include-untracked -- $(git ls-files --modified --others --exclude-standard)'

# Ruby
alias be="bundle exec"
# alias rserver="bundle exec rails server"
# alias rconsole="bundle exec rails console"
# Rubocop on uncommitted files or files modified since master.
# alias rcu="git ls-files -m | xargs ls -1 2>/dev/null | xargs bundle exec rubocop" #runs on files that should be excluded
# alias rcm="git diff-tree -r --no-commit-id --name-only head origin/master | xargs bundle exec rubocop"
# alias rsu="ls-files -m *_spec.rb | xargs ls -1 2>/dev/null | xargs bundle exec rspec"
# alias rsu="ls-files -m *_spec.rb | xargs ls -1 2>/dev/null | xargs bundle exec rspec"

# alias z="zeus"
# alias zs="bundle && be rake db:migrate db:test:prepare && zeus start" #prepare bundle and db before serving
# alias rspec='$(test -e .zeus.sock && echo "zeus" || echo "bundle exec") rspec'

# Rspec
alias headless="FIREFOX_ARGS=-headless bundle exec" #run with headless arg
alias headful="FIREFOX_ARGS= "
alias rspecjs="bundle exec rspec --tag=js spec/features/" #run non-browser feature tests (? or only browser tests?)

#run quickest (unit) tests. use with --fail-fast OR, just run whole suite in background first, then cycle through failures with -n
RSPECQUICK_EXCLUDE="spec/features/|big_spreadsheet|process_excel_job|new_users_csv" # ignore browser, slow and flaky specs
alias rspecquick="bundle exec parallel_rspec -n $PARALLEL_TEST_PROCESSORS --exclude-pattern \"$RSPECQUICK_EXCLUDE\"" # parallel_rspec uses regex for exclude-pattern. Not to be confused with rspec param of same name.
# alias rspecquick="rspec --tag ~type:feature --exclude-pattern \"**/big_spreadsheet_spec.rb,**/process_excel_job_spec.rb,**/*new_users_csv*\"" ## using rspec exclude by glob
alias pspec="bundle exec rake parallel:spec"

## disabled because autoloading is failing in spring.
## todo: start amphetamine session before starting, and end after (https://iffy.freshdesk.com/support/solutions/articles/48000078223-applescript-documentation)
# alias rspec='$(test -e "bin/rspec" && echo "bin/" || echo "bundle exec ")rspec' #requires spring binstub --all
# alias rails='$(test -e "bin/rails" && echo "bin/" || echo "bundle exec ")rails'
# alias rake='$(test -e "bin/rake" && echo "bin/" || echo "bundle exec ")rake'
alias rspec='bundle exec rspec' #requires spring binstub --all
alias rails='bundle exec rails'
alias rake='bundle exec rake'


#Select files
alias recent-ruby-files="gfind . -type f -cmin -60 -not -path '*/\.*' -not -path './log/*' -path '*.rb' -printf \"%p\n\" "
alias changed-since-master="git diff --name-only master"
alias uncommitted-files="git ls-files -m"
alias staged-files="git diff --name-only --cached"

# Todo:  function to list any uncomitted files as string for easy usage
# function recent-ruby-files() {
#   MINS=60
#   echo $(gfind . -type f -cmin -$MINS -not -path '*/\.*' -not -path './log/*' -path '*.rb' -printf '%p ')
# }

# Rubocop autocorrect staged files
alias rcs="rubocop -a \$(staged-files *.rb)"


#Sublime - Open project file if it exists, otherwise open dir. TODO: should probably change to a function and accept a parameter
alias st="if [ -e *.sublime-project ]; then subl *.sublime-project; else subl .; fi"


#General
function dt() { echo $( date +%Y-%m-%d ); }
# alias rm="trash" # hasseg.org/trash #TODO: write a wrapper to better support rm flags
alias pd="pushd" # a nice alternative to cd
alias ll="ls -lhF" # List in long format, with human-readable filesizes and show slashes for folders
alias ltr="ls -ltrh | tail" #show most recent files in folder. todo: pass through params to less
alias rpe="realpath -e" # show full path name of a file (think pwd+ls)

alias less="less -r" # Show raw control characters. Could have set in $LESS but meh.
alias lessg='less -nr +GF' # Less with no line Numbers, show Raw characters (colours and utf8), Go to end, Follow
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

# Diff styled just like in Git https://stackoverflow.com/a/25430324/421243
function gdiff () { diff -u $@ | colordiff | less -R; }
