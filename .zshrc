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

RPROMPT="[%*]"

source $ZSH/oh-my-zsh.sh

# STATUS CODE ===================================

col_success="$(tput setaf 10)"
col_failure="$(tput setaf 9)"
col_normal="$(tput sgr0)"
col_fade="$(tput setaf 15)"

function precmd() {
    local code="$?"

    if [ "$code" -ne 0 ];
    then
        if [ "$code" -gt 128 -a "$code" -le 192 ]
        then # Failure or Signal
            echo -n "${col_fade}[${col_failure}${code}${col_normal}/${col_failure}"
            echo -n $(kill -l "${code}" | tr '[:upper:]' '[:lower:]')
            echo "${col_fade}]${col_normal}"
        else # Failure
            echo "${col_fade}[${col_failure}${code}${col_fade}]${col_normal}"
        fi
    else # No error
        echo "${col_fade}[${col_success}${code}${col_fade}]${col_normal}"
    fi
}

# ===============================================

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
