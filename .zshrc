export ZSH="$HOME/.oh-my-zsh"
export FZF_DEFAULT_COMMAND="fd --type f"

ZSH_DISABLE_COMPFIX="true"

DISABLE_UPDATE_PROMPT="true"

plugins=(git history zsh-autosuggestions common-aliases npm z colored-man-pages zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

set -o vi
set keymap  server
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias neo="nvim ."
alias zshconfig="nvim $HOME/.zshrc"
alias nvimconfig="nvim $HOME/.config/nvim"
alias zshreload="source $HOME/.zshrc"
alias ohmyzsh="nvim $HOME/.oh-my-zsh"
alias alacritty="nvim $HOME/.config/alacritty/alacritty.yml"
alias chromep='open -a "Google Chrome" --args --proxy-pac-url=http://localhost:2000/proxy.pac'
alias curl='curl -s'
alias cat='bat --theme=ansi-dark --italic-text=always'
alias grep='rg'
alias mux='tmux'
alias npmrc='npm run dev:client'
alias npmrs='npm run dev:server'
alias ghciX='ghci -XNoImplicitPrelude'

eval "$(starship init zsh)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
