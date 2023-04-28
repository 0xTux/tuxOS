# Setup Path
export PATH="$PATH:$HOME/.config/bspwm/bin"

# Setup Starship
export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

export ZSH=$HOME/.oh-my-zsh
plugins=(git zsh-syntax-highlighting zsh-autosuggestions history sudo)
source $ZSH/oh-my-zsh.sh

pfetch