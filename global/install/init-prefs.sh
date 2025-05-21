# Initialise Preferences
# also load OS-specific and work-specific stuff
#
# prereqs:
# 	Sublime (install  Tomorrow colour scheme first to avoid sublime going crazy?)
#   DiffMerge

set -e # Exit on error
set -x # Display each command so user is aware of what's happening
home=/users/$USER
# config=$0/../config #~/system/global/config
config=$home/system/global/config

## Link version controlled files in the relevant places
pushd $home/
	ln -snf "$config/.bash_profile"
	ln -snf "$config/.bash_aliases"
popd

## Link Sublime user config
# pushd "$home/Library/Application Support/Sublime Text 3/Packages"
#     mv User User.bak
# 	ln -snf "$config/sublime/User"
# popd

## DiffMerge
# pushd $home/Library/Preferences/
# 	ln -snf "$config/SourceGear\ DiffMerge\ Preferences"
# popd

## Global Git Prefs (haven't linked the file in, because other parts of .gitconfig might be env-specific)
git config --global core.excludesfile "$config/global.gitignore"
git config --global push.default current # set upstream branchname to current branchname by default (https://stackoverflow.com/a/22933955/421243)
### Aliases
git config --global alias.co checkout
git config --global alias.br "branch --sort=-committerdate" # recent branches
git config --global alias.ci commit
git config --global alias.ca commit -a
git config --global alias.cimend commit  --amend
git config --global alias.camend commit -a --amend
git config --global alias.wip "commit -a -m 'WIP' -m '[skip ci]' --no-verify"
git config --global alias.wiptest "commit -a -m 'WIP - passing tests?' --no-verify"
git config --global alias.st status
git config --global alias.cp cherry-pick
# https://gist.github.com/dacook/7eddd0c97b2844cc9157ba2e2f0470bd
git config --global alias.hist "log --pretty=format:'%C(blue)%ad%C(reset) %C(yellow)%h%C(reset) %C(green)%an%C(reset): %s %C(blue)%d%C(reset)' --graph --date=short"
git config --global alias.l "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"
git config --global alias.merge-upstream '!git fetch upstream && git merge upstream/master' #it may be tempting to rebase, but don't
### DiffMerge (http://twobitlabs.com/2011/08/install-diffmerge-git-mac-os-x/)
git config --global alias.showtool '!showci () { rev=$(git rev-parse "${*:-HEAD}"); git difftool $rev~1 $rev; }; showci' # https://stackoverflow.com/a/33975521/421243
git config --global alias.rc "rebase --continue"
git config --global alias.stash-show "stash show -p" # Show stash with a patch just like you'd expect it to
git config --global alias.tag "v --list 'v*' --sort v:refname"
git config --global alias.pf push --force-with-lease



git config --global difftool.prompt false
# git config --global difftool.diffmerge.cmd 'diffmerge "$LOCAL" "$REMOTE"'
git config --global difftool.meld.cmd 'meld "$LOCAL" "$REMOTE"'
git config --global diff.tool meld
# git config --global merge.tool diffmerge
# git config --global mergetool.diffmerge.cmd 'diffmerge --merge --result="$MERGED" "$LOCAL" "$(if test -f "$BASE"; then echo "$BASE"; else echo "$LOCAL"; fi)" "$REMOTE"'
# git config --global mergetool.diffmerge.trustExitCode true
git config --global core.editor "vim -f" #https://stackoverflow.com/a/22699894/421243


bundle config set --global auto_install true # Automatically run bundle install when gems are missing.
