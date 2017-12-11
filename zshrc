#oh-my-zsh configs
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=agnoster
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Source my custom files
source $HOME/.dotfiles/zsh/aliases
source $HOME/.dotfiles/zsh/pathes
source $HOME/.dotfiles/zsh/language_settings

export EDITOR=mvim
export VIM_HOME=$HOME/.vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh ]
