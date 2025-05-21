
# Environment Variables
# PATH=$PATH:~/system/global/bin
PATH=$PATH:~/system/nix/scripts
PATH=$PATH:/Applications/Meld.app/Contents/MacOS ## TODO: install proerly, I think whtih a symbolic link

source ~/system/global/config/colours.sh

# Simple Command Prompt
PS1='\[$BLUE\]\w \$\[$RESET\] '

# Parallel specs config
export PARALLEL_TEST_PROCESSORS=4 # use only half of 8 cpu cores so I can still multitask

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

export FF45="tmp/firefox-45.9.0esr/Firefox.app/Contents/MacOS/firefox"
export FF="tmp/firefox-%s/Firefox.app/Contents/MacOS/firefox"
export FIREFOX_BINARY_PATH=$FF
export FIREFOX_ARGS=-headless #-jsconsole

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/Users/dcook/projects/openfoodnetwork:$PATH"
export PATH="/Users/dcook/bin:$PATH"


# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

# Nodenv
eval "$(nodenv init -)"

# OFN-specific config
export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible-vault-password
# export FETCH_OFN_SECRETS=TRUE  # disabled because https://github.com/openfoodfoundation/ofn-install/issues/861

# Added by `rbenv init` on Tue 17 Dec 2024 11:24:49 AEDT
# eval "$(~/.rbenv/bin/rbenv init - --no-rehash bash)"
