# Because sometimes you want to do it fast..
# curl -s https://raw.githubusercontent.com/dacook/system/master/osx/scripts/hoffify.sh | bash

imgsrc="http://www.flickeringmyth.com/wp-content/uploads/2015/03/hasselhoff.jpg"
imgpath="$PWD/unsuspicious-image-file.jpg"

curl -o "$imgpath" "$imgsrc"
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$imgpath\""
osascript -e "tell application \"System Events\" to set picture of every desktop to \"$imgpath\""

## More trolling
echo 'I love David Hasselhoff' | pbcopy
echo "Also, free chocolates on my desk, come and get them!" | mail -s "I have been Hoffified" melbourne@squiz.net