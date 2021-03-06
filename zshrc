#oh-my-zsh configs
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=muse
plugins=(git autojump)
source $ZSH/oh-my-zsh.sh
# Source my custom files
source $HOME/.dotfiles/zsh/aliases
source $HOME/.dotfiles/zsh/pathes
source $HOME/.dotfiles/zsh/language_settings

export EDITOR=mvim
export VIM_HOME=$HOME/.vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
