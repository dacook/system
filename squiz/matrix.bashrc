# Some suggested things to add to a squiz server .bashrc or .bash_profile file

# User specific environment variables
export matrix=/var/www/-internet-prod
export deploy=/var/www/nobackup/deploy
export exp=/var/www/nobackup/deploy/exports

# User specific aliases and functions
alias sudoa='sudo -u apache'
alias matrixsqlclient='sudo -u apache php scripts/matrixsqlclient.php $PWD'
alias squish='sudo -u apache /tmp/squiz_squish/squish'
alias mirror="sudo -u apache php packages/mirror/scripts/mirror.php"
alias hr="echo -e \"\n$(tput setaf 1)-----------------------------$(tput sgr0)\n\"" # A red horizontal rule

function datehr () { hr; date; hr; }

alias errlog='tail -f data/private/logs/error.log | grep --colour=always " - .*"'

# Date aliases, eg: > output-`datetime`.log
alias datetime='date +%Y%m%d-%H%M'
alias ymd='date +%Y%m%d'
alias hms='date +%H%M%S'
alias hm='date +%H%M%S'


## Bonus, show me what's here:
# if [ "$TERM" = "xterm-256color" ]; then
#   cd /var/www
#   grep -r 'SQ_CONF_SYSTEM_ROOT_URLS' */data/private/conf/main.inc
#   ls -l
# fi

