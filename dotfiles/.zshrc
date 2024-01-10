# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle :omz:plugins:ssh-agent lazy yes
zstyle :omz:plugins:ssh-agent lifetime 10m
zstyle :omz:plugins:ssh-agent quiet yes

plugins=(
    asdf
    bun
    colored-man-pages
    composer
    docker
    docker-compose
    git
    golang
    kubectl
    npm
    ssh-agent
    sudo
    terraform
    yarn
    zsh-autosuggestions
    zsh-syntax-highlighting
)

PROMPT_EOL_MARK=''

source $ZSH/oh-my-zsh.sh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

grb-safe() {
  git stash >> /dev/null
  grb $@
  git stash pop >> /dev/null
}

alias copy="xclip -sel clip"
alias getip="ifconfig wlo1 | grep -oP --color=never '(?<=inet\s)\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'"
alias gms="gm --squash"
alias py="python3"
alias zshapply="source ~/.zshrc"
alias zshconfig="vim ~/.zshrc"
alias ls="exa --icons"

export GPG_TTY=$(tty)
export PYTHONDONTWRITEBYTECODE=1
export SUDO_PROMPT="Magic word please? "
export KUBECONFIG=$HOME/.kube/config
export PATH=$PATH:$(go env GOPATH):$HOME/.bun/bin

source_scripts=(
  ~/.p10k.zsh
  ~/.zsh/aliases
  ~/.asdf/plugins/java/set-java-home.zsh
  ~/google-cloud-sdk/path.zsh.inc
  ~/google-cloud-sdk/completion.zsh.inc
)

for script in $source_scripts; do
  [[ -f "$script" ]] && . $script
done

eval $(thefuck --alias)
