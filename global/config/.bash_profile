
# Environment Variables
# PATH=$PATH:~/system/global/bin
PATH=$PATH:~/system/nix/scripts
PATH=$PATH:/Applications/Meld.app/Contents/MacOS ## TODO: install proerly, I think whtih a symbolic link
source ~/system/global/config/colours.sh

# Simple Command Prompt
PS1='\[$BLUE\]\w \$\[$RESET\] '

# Aliases
source ~/.bash_aliases

# Features
# Git completion from here: https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
if [ -f ~/system/global/config/git-completion.bash ]; then
  . ~/system/global/config/git-completion.bash
fi

# Env specific
#if os eq 'osx' (assume it is)
	source ~/system/osx/config/osx.bash_profile
	export BASH_SILENCE_DEPRECATION_WARNING=1
#fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export GROOVY_HOME=/usr/local/opt/groovy/libexec

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export FF="tmp/firefox-%s/Firefox.app/Contents/MacOS/firefox"
export FF45="tmp/firefox-45.9.0esr/Firefox.app/Contents/MacOS/firefox"

export FIREFOX_BINARY_PATH=$FF45