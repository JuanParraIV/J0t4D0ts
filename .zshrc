export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Si la sesión es interactiva
if [[ $- == *i* ]]; then
    # Commands to run in interactive sessions can go here
fi

if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    BREW_BIN="/opt/homebrew/bin/brew"
else
    # Linux
    BREW_BIN="/home/linuxbrew/.linuxbrew/bin/brew"
fi

# Usar la variable BREW_BIN donde se necesite
eval "$($BREW_BIN shellenv)"

source $(dirname $BREW_BIN)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(dirname $BREW_BIN)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PROJECT_PATHS="/your/work/path/"

# Iniciar tmux si la sesión es interactiva y no estamos ya en tmux
if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then

    exec tmux

fi


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


#plugins
plugins=(
  pj 
  command-not-found     
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


# Inicializar Starship para zsh

eval "$(starship init zsh)"

