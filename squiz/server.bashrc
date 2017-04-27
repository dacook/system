# Some suggested things to add to a squiz server .bashrc or .bash_profile file

# User specific environment variables
matrix=/var/www/internet-prod/

# User specific aliases and functions
alias sudoa='sudo -u apache'
alias matrixsqlclient='sudo -u apache php scripts/matrixsqlclient.php $PWD'
alias mirror="sudo -u apache php packages/mirror/scripts/mirror.php"
alias errlog='tail -f data/private/logs/error.log | grep --colour=always " - .*"'

## Bonus, show me what's here:
if [ "$TERM" = "xterm-256color" ]; then
  cd /var/www
  grep -r 'SQ_CONF_SYSTEM_ROOT_URLS' */data/private/conf/main.inc
  ls -l
fi


# And funnelback
# https://docs.funnelback.com/15.8/more/extra/warccat.html
alias WarcCat='$SEARCH_HOME/linbin/java/bin/java -classpath "$SEARCH_HOME/lib/java/all/*" com.funnelback.warc.util.WarcCat'