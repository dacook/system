## Automator script to find the SVN url of selected file(s) (see [automator workflow](../../osx/Library/Services/Copy remote repo url.workflow))
urls=""
for f in "$@"
do
  # Look for SVN url
  url=$(svn info "$f" | grep "URL" | sed -n 's/URL: \(.*\)/\1/p')
  # if [[ -z "$url" ]]; then 
    # todo: try GIT url, might be able to just use GitHubinator (https://github.com/ehamiter/GitHubinator/blob/master/githubinator.py)
  # fi;
  if [[ -n "$url" ]]; then 
    urls="$urls$url\n" 
  fi;
done

if [[ -n "$urls" ]]; then 
  # todo: remove last linebreak
  echo -ne "$urls" | pbcopy
fi;