# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# Make sure homebrew stuff will be first in the path
PATH=/usr/local/bin:/usr/local/sbin:$PATH
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'

if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

if [ -f ~/.priv_aliases ]; then
  . ~/.priv_aliases
fi

export AWS_BLUE_ACCESS_KEY_ID=AKIAIKQF477VEMUNMQQQ
export AWS_BLUE_SECRET_ACCESS_KEY_ID=+0FjcOIhaBxum3u78pICMIX+HXg6+3WTcgR/vr+j

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export RM_ENV=development
export RM_CONSOLE_PATH=liveview-dev

export THIT_ENV=development
export THIT_TWILIO_ACCOUNT_SID=AC636b59d3be301d1799d876200174e254
export THIT_TWILIO_AUTH_TOKEN=9d192b7f31d3b2b466b0737777e676b4
export AUTOFEATURE=true
PATH=$PATH:/usr/local/share/npm/bin

source $ZSH/oh-my-zsh.sh
unsetopt correct
export EDITOR='vim'
source ~/.bin/tmuxinator.zsh
