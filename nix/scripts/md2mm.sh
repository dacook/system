## simple convert Markdown to MoinMoin
sed \
-e "s/\*\*/'''/g" \
-e "s/^\*/ */g" \
-e "s/^#### \(.*\)/==== \1 ====/g" \
-e "s/^### \(.*\)/=== \1 ===/g" \
-e "s/^## \(.*\)/== \1 ==/g" \
-e "s/^# \(.*\)/= \1 =/g" \
-e "s/~~\(.*\)~~/ --(\1)-- /g" \
-e "s/\[\(.*\)\](\([^)]*\))/[[\2|\1]]/g" \
-e "s/\\\\\*/*/g" \
$1 > $2

# gave up on numbered lists
# -e "s/^\([0-9]+\.\)/ \1/g" \

# just realised I don't ned to change inline code
#-e "s/\`\([^\`]\)*\`/{{{\1}}}/g" \