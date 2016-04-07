## Requires Homebrew and NPM
brew update; brew install imagemagick
npm install nativefier -g
curl -o ~/Downloads/squiz-favicon.png https://www.squiz.net/__template/45/favicon.png
nativefier --icon "/Users/dcook/Downloads/squiz-favicon.png" --name "Timesheets" https://intranet.squiz.net/timesheets_nouveau.php