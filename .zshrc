# ----------------------------------------
# 1. Basic Environment Setup
# ----------------------------------------

echo 'hello world';
# Set TERM
export TERM=xterm-256color

# Set PATH
#export PATH="/usr/lib/kitty:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin



# History settings
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
HISTDUP=erase

setopt appendhistory       # Append to history, don't overwrite
setopt sharehistory        # Share history across terminals
setopt hist_ignore_space   # Ignore commands starting with space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ----------------------------------------
# 2. Zinit (Plugin Manager)
# ----------------------------------------

# Define Zinit Home
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Install Zinit if not present
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname "$ZINIT_HOME")"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# ----------------------------------------
# 3. Theme / Prompt Setup (Auto Installer)
# ----------------------------------------

# Set paths
OMP_BIN="$HOME/.local/bin/oh-my-posh"
OMP_THEME_DIR="$HOME/.poshthemes"
OMP_THEME="$OMP_THEME_DIR/bubblesline.omp.json"

# Download Oh My Posh binary if not present
if [ ! -f "$OMP_BIN" ]; then
    echo "[+] Downloading Oh My Posh binary..."
    mkdir -p "$(dirname "$OMP_BIN")"
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d "$(dirname "$OMP_BIN")"
fi

# Download theme if not present
if [ ! -f "$OMP_THEME" ]; then
    echo "[+] Downloading bubblesline theme..."
    mkdir -p "$OMP_THEME_DIR"
    curl -fsSL -o "$OMP_THEME" https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/bubblesline.omp.json
fi

# Initialize Oh My Posh
eval "$($OMP_BIN init zsh --config $OMP_THEME)"


# ----------------------------------------
# 4. Theme / Prompt Setup
# ----------------------------------------

# Load Oh My Posh
# Todo download the theme if not exist using wget
# Todo download oh-my-posh if not exist
eval "$(oh-my-posh init zsh --config ~/.poshthemes/bubblesline.omp.json)"

# ----------------------------------------
# 4. Keybindings
# ----------------------------------------


bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# ----------------------------------------
# 5. Aliases
# ----------------------------------------

alias ls='ls --color'
alias c='clear'
alias grep='grep --color'
alias e='exit'
alias py-activate='source ~/program/Python/script/bin/activate'
alias reload='source ~/.zshrc'


alias urldecode='python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'

alias urlencode='python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'

# ----------------------------------------
# 6. Shell Integrations
# ----------------------------------------


# fzf
# source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide (after fzf, important!)
eval "$(zoxide init zsh --cmd cd)"

fzf-history-widget() {
  BUFFER=$(cat ~/.zsh_history | cut -d';' -f2- | fzf --exact --tac --no-sort )
  CURSOR=${#BUFFER}
  zle reset-prompt
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget


# ----------------------------------------
# End of .zshrc
# ----------------------------------------
