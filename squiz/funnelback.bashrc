# Some suggested things to add to a squiz funnelback server .bashrc or .bash_profile file

# User specific environment variables
conf=/opt/funnelback/conf/
data=/opt/funnelback/data/

# User specific aliases and functions

# https://docs.funnelback.com/15.8/more/extra/warccat.html
alias WarcCat='$SEARCH_HOME/linbin/java/bin/java -classpath "$SEARCH_HOME/lib/java/all/*" com.funnelback.warc.util.WarcCat'
