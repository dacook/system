#!/bin/bash
# https://gist.github.com/mkllnk/182dcac856fc8eebe154b48148018300

#set -ex

usage="  Usage: $0 <repo> <branch>
or:     $0 user:branch

Example: $0 Em-AK/openfoodnetwork.git i18n-tests
         $0 Em-AK:i18n-tests"

case "$1" in
    *:*)
        user="${1%:*}"
        branch="${1#*:}"
        url="$(git config remote.upstream.url)"
        reponame="${url##*/}"
        repo="$user/$reponame"
	localbranch="${2:-$branch}"
        ;;
    else)
        repo="$1"
        branch="$2"
        ;;
esac

test -z "$repo" && echo "$usage" && exit 1
test -z "$branch" && echo "$usage" && exit 1

if git rev-parse --verify -q "$localbranch" > /dev/null; then
	git checkout "$localbranch"
	git pull
else
	git fetch "git@github.com:$repo" "$branch" || exit $?
	git checkout FETCH_HEAD -b "$localbranch"
	git config "branch.$localbranch.remote" "git@github.com:$repo"
	git config "branch.$localbranch.merge" "refs/heads/$branch"
fi
