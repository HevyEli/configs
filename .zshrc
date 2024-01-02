# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

#load zsh them
#ZSH_THEME="powerlevel10k/powerlevel10k"

# ENV Variables/PATHs
export ZSH="${HOME}/.oh-my-zsh"
export GOPATH="${HOME}/go"
export EDITOR=vim
export KUBE_EDITOR=vim
export AWS_CLI_AUTO_PROMPT=on-partial
export PATH=/usr/local/bin/:$PATH:$HOME/bin
export PATH="${PATH}:${HOME}/.krew/bin"
export KUBECONFIG=~/.kube/config

# ZSH Setup
plugins=(zsh-z
  zsh-autosuggestions
  aws
  git
  brew
  docker
  docker-compose
  terraform
  zsh-syntax-highlighting
  helm
  kubectl
  kubectx
)

source $ZSH/oh-my-zsh.sh
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# This needs to be after the autoloads
kubectl completion zsh >~/.kubectl-completion
source ~/.kubectl-completion
complete -C '/usr/local/bin/aws_completer' aws

# Env Variables
# Extra more custom ENV variables
[[ -f ~/.zsh/envs.zsh ]] && source ~/.zsh/envs.zsh

# Aliases and Functions
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh

# Setup Starship prompt
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
eval "$(starship init zsh)"

# Setup Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
#source "/opt/homebrew/opt/spaceship/spaceship.zsh"
