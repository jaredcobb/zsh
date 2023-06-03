# Path to your oh-my-zsh configuration.
ZSH=$HOME/zsh/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"

ZSH_THEME="../../theme/jaredcobb"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump gitfast git-extras history-substring-search gem npm yarn heroku)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

### EXPORTS ###

export PATH=$HOME/bin:$HOME/bin/phpcs/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/ruby/bin:/usr/local/share/npm/bin:/usr/bin:$HOME/.composer/vendor/bin/:$PATH
export JAVA_HOME=/Library/Java/Home
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

# Data Harmonization
export NOTEBOOK_UID=$UID
export NOTEBOOK_WORKING_DIR="/Users/jared/code/healthcare-data-harmonization"
export NOTEBOOK_FUNCTION_LIBRARY_DIR="$NOTEBOOK_WORKING_DIR/mapping_configs/hl7v2_fhir_r4"
export NOTEBOOK_SERVICE_ACCOUNT_FILENAME="key.json"
export NOTEBOOK_SERVICE_ACCOUNT_DIR="/Users/jared/key"
export GOOGLE_APPLICATION_CREDENTIALS="$NOTEBOOK_SERVICE_ACCOUNT_DIR/$NOTEBOOK_SERVICE_ACCOUNT_FILENAME"

### ALIASES ###

alias l='ls -aGhlp'
alias prune='git remote prune origin'
alias t='tig'

### FUNCTIONS ###

# delete local branches that start with the name "case/"
deletecases() {
    git for-each-ref --format="%(refname:short)" refs/heads/case/\* | xargs git branch -D
}

# create a proxy through shell account (local machine only)
tunnel() {
   sudo killall -v ssh
   sudo killall -v ssh-agent
   sudo ssh -fND localhost:21 $1
}

# customize the ~/.ssh/config settings to force git to use proxy
tunnelgit() {
	if [ "$1" == "false" ]; then
		ln -sfn ~/config/ssh_config ~/.ssh/config
	else
		ln -sfn ~/config/ssh_config_with_proxy ~/.ssh/config
	fi
}

untar() {
	tar -xzvf $1
}

### SETTINGS ###

# brew info autojump says to do this
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# allow carets for git commands HEAD^
# https://github.com/robbyrussell/oh-my-zsh/issues/449
setopt NO_NOMATCH

# use vi for shell command line editing
# note: this breaks up/down arrow history autocompletion
bindkey -v
bindkey '^R' history-incremental-search-backward

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jared/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jared/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jared/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jared/bin/google-cloud-sdk/completion.zsh.inc'; fi
