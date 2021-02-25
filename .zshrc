# Path to your oh-my-zsh installation.
export ZSH="/home/ludal/.oh-my-zsh"

ZSH_THEME="awesomepanda"

plugins=(
    colored-man-pages
    composer
    docker
    docker-compose
    git
    npm
    sudo
    zsh-syntax-highlighting
    zsh-autosuggestions
)

PROMPT_EOL_MARK=''

source $ZSH/oh-my-zsh.sh

RPROMPT="%{$FG[245]%} %? ↵ [%*]%{$reset_color%}"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias zshconfig="vim ~/.zshrc"
alias zshapply="source ~/.zshrc"
alias py="python3"
