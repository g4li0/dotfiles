# ---------------------------- #
# Tutorial video:              #
# https://youtu.be/ud7YxC33Z3w #
# ---------------------------- #

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory that stores zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if it's not already installed
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add Oh-My-Zsh plugins
# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found
zinit snippet OMZP::npm
#zinit snippet OMZP::docker
#zinit snippet OMZP::sudo


# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history	
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space # ignore commands starting with space
setopt hist_ignore_all_dups # ignore duplicate commands
setopt hist_save_no_dups # do not save duplicate commands
setopt hist_ignore_dups # ignore duplicate commands
setopt hist_find_no_dups # do not display duplicate commands

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # lowercase matches uppercase
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # color completion
zstyle ':completion:*' menu no
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='~/.cargo/bin/lsd'


# Shell Integrations

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"
# zoxide
#eval "$(zoxide init --cmd cd zsh)"
