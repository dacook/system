#!/bin/bash
# Delete a branch, locally and remotely
# usage: git-branch-delete.sh branchname [additional-parameter]
# based from https://multiplestates.wordpress.com/2015/02/05/rename-a-local-and-remote-branch-in-git/
set -e # exit on error

branch=$1
git branch -d $2 $branch # delete branch locally
git push origin --delete $branch # delete branch from server 

echo -e "\nNote: other users may also need to manually delete the old branch:\n"
echo -e " git branch -d $branch\n"
