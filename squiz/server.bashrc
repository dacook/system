# Some suggested things to add to a squiz server .bashrc file

# User specific environment variables
matrix=/var/www/internet-prod/

# User specific aliases and functions
alias matrixsqlclient='sudo -u apache php scripts/matrixsqlclient.php $PWD'
alias mirror="sudo -u apache php packages/mirror/scripts/mirror.php"
