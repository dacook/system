# Some suggested things to add to a squiz server .bashrc or .bash_profile file

# User specific environment variables
matrix=/var/www/internet-prod/

# User specific aliases and functions
alias matrixsqlclient='sudo -u apache php scripts/matrixsqlclient.php $PWD'
alias mirror="sudo -u apache php packages/mirror/scripts/mirror.php"

## Bonus, show me what's here:
if [ "$TERM" = "xterm-256color" ]; then
  cd /var/www
  grep -r 'SQ_CONF_SYSTEM_ROOT_URLS' */data/private/conf/main.inc
  ls -l
fi